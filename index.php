<?php

//

require 'vendor/autoload.php';

//

echo '<pre>';

echo '1';

//print_r(spl_autoload_functions());

//

/*
[host] => us-cdbr-iron-east-03.cleardb.net
[user] => b808728448ca7e
[pass] => 2c744f8b
[path] => /heroku_5714b88b9ab57b4
[query] => reconnect=true

mysql -h 'us-cdbr-iron-east-03.cleardb.net' -u 'b808728448ca7e' -p 'heroku_5714b88b9ab57b4' -e "SHOW TABLES"

*/


$url = parse_url(getenv("CLEARDB_DATABASE_URL"));

print_r($url);

$server = $url["host"];
$username = $url["user"];
$password = $url["pass"];
$db = substr($url["path"], 1);

// Create connection
$conn = new mysqli($server, $username, $password, $db);
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