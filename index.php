<?php

//

ini_set('display_errors', 1);

//

require 'vendor/autoload.php';

//

// http://magento-heroku.herokuapp.com/?objects=true&database=true&connect=true

echo '<pre>';

print_r($_SERVER);
print_r($_REQUEST);

//

if ( array_key_exists('phpinfo', $_REQUEST) ){

    phpinfo();

}

//

if ( array_key_exists('objects', $_REQUEST) ){

    print_r(spl_autoload_functions());
    print_r(get_loaded_extensions());

}

//

if ( array_key_exists('database', $_REQUEST) ){

    if ( array_key_exists('connect', $_REQUEST) ){

        // Create connection

        /*
        $mysql_database = parse_url(getenv("CLEARDB_DATABASE_URL")); 
        print_r($mysql_database);
        $host = $mysql_database["host"];
        $user = $mysql_database["user"];
        $pass = $mysql_database["pass"];
        $db = substr($mysql_database["path"], 1);

        try {
            $conn = new mysqli($host, $user, $pass, $db);
        } catch (Exception $e) {
            print_r($e->getMessage());
        }
        */

        $postgresql_database = parse_url(getenv("DATABASE_URL"));
        print_r($postgresql_database);
        $host = $postgresql_database["host"];
        $port = $postgresql_database["port"];
        $user = $postgresql_database["user"];
        $pass = $postgresql_database["pass"];
        $db = substr($postgresql_database["path"], 1);

        try {
            $conn = new pg_connect("host=$host port=$port dbname=$db user=$user password=$pass");
        } catch (Exception $e) {
            print_r($e->getMessage());
        }

        print_r($conn);

        /*

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }       

        $sql = "show tables";
        $result = $conn->query($sql);

        print_r($result);

        if ($result->num_rows > 0) {
            // output data of each row
            while($row = $result->fetch_assoc()) {
                print_r($row);
            }
        } else {
            echo "0 results";
        }

        $conn->close();

        */

    }
}

//

    