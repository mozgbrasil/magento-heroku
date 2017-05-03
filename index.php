<?php

//

require 'vendor/autoload.php';

//

echo '<pre>';

print_r($_SERVER);
print_r($_REQUEST);

//

if ( array_key_exists('autoloads', $_REQUEST) ){

    print_r(spl_autoload_functions());

}

//

if ( array_key_exists('mysqli', $_REQUEST) ){

    /*
    [host] => us-cdbr-iron-east-03.cleardb.net
    [user] => b808728448ca7e
    [pass] => 2c744f8b
    [path] => /heroku_5714b88b9ab57b4
    [query] => reconnect=true

    mysql -h 'us-cdbr-iron-east-03.cleardb.net' -u 'b808728448ca7e' -p 'heroku_5714b88b9ab57b4' -e "SHOW TABLES"

    */

    $database = parse_url(getenv("CLEARDB_DATABASE_URL"));
    $database = parse_url(getenv("MONGODB_URI"));

    print_r($database);

    $host = $database["host"];
    $user = $database["user"];
    $pass = $database["pass"];
    $db = substr($database["path"], 1);

    if ( array_key_exists('connect', $_REQUEST) ){

        // Create connection

        try {
            $conn = new mysqli($host, $user, $pass, $db);
            print_r($conn);
        } catch (Exception $e) {
            print_r($e->getMessage());
        }

        try {
            $conn = new PDO("mongodb://$user:$pass@$host:27391/$db", "$user", "$pass");
            print_r($conn);
        } catch (Exception $e) {
            print_r($e->getMessage());
        }

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        } 

        print_r($conn);

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

    }
}

//

    