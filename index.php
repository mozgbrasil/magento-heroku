<?php

//

require 'vendor/autoload.php';

//

echo '<pre>';

//print_r(spl_autoload_functions());

//


/*db: heroku_5714b88b9ab57b4
Username:	b808728448ca7e
Password:	2c744f8b
*/

$url = parse_url(getenv("CLEARDB_DATABASE_URL"));

print_r($url);

$server = $url["host"];
$username = $url["user"];
$password = $url["pass"];
$db = substr($url["path"], 1);

$conn = new mysqli($server, $username, $password, $db);

print_r($conn);