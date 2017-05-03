<?php

//

ini_set('display_errors', 1);

//

require 'vendor/autoload.php';

//

// http://magento-heroku.herokuapp.com/?objects=true&database=true&scandir=true

dump($_SERVER);
dump($_REQUEST);

//

if ( array_key_exists('scandir', $_REQUEST) ){

    $dir    = isset($_REQUEST['dir']) ? $_REQUEST['dir'] : __DIR__;
    $files  = scandir($dir);
    dump($dir);
    dump($files);

}

//

if ( array_key_exists('phpinfo', $_REQUEST) ){

    phpinfo();

}

//

if ( array_key_exists('objects', $_REQUEST) ){

    dump(spl_autoload_functions());
    dump(get_loaded_extensions());

}

//

if ( array_key_exists('database', $_REQUEST) ){

    // Create connection

    /*
    $mysql_database = parse_url(getenv("CLEARDB_DATABASE_URL")); 
    dump($mysql_database);
    $host = $mysql_database["host"];
    $user = $mysql_database["user"];
    $pass = $mysql_database["pass"];
    $db = substr($mysql_database["path"], 1);

    try {
        $conn = new mysqli($host, $user, $pass, $db);
    } catch (Exception $e) {
        dump($e->getMessage());
    }
    */

    $postgresql_database = parse_url(getenv("DATABASE_URL"));
    dump($postgresql_database);
    $host = $postgresql_database["host"];
    $port = $postgresql_database["port"];
    $user = $postgresql_database["user"];
    $pass = $postgresql_database["pass"];
    $db = substr($postgresql_database["path"], 1);

    try {
        $conn = new pg_connect("host=$host port=$port dbname=$db user=$user password=$pass");
    } catch (Exception $e) {
        dump($e->getMessage());
    }

    dump($conn);

    /*

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }       

    $sql = "show tables";
    $result = $conn->query($sql);

    dump($result);

    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            dump($row);
        }
    } else {
        echo "0 results";
    }

    $conn->close();

    */
}

//

    