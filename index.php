<?php

//

ini_set('display_errors', 1);

//

require 'vendor/autoload.php';

//

/*

http://magento-heroku.herokuapp.com/?server=true

http://magento-heroku.herokuapp.com/?database=true

http://magento-heroku.herokuapp.com/?scandir=true&load_file=true&dir=/app/root/var/report&file=/app/root/var/report/821626541659

*/

//

if ( empty($_REQUEST) ){

    header('Location: root/');

}

//

if ( array_key_exists('server', $_REQUEST) ){

    dump($_SERVER);
    dump($_REQUEST);

}

//

if ( array_key_exists('scandir', $_REQUEST) ){

    $dir    = isset($_REQUEST['dir']) ? $_REQUEST['dir'] : __DIR__;
    $files  = scandir($dir);
    dump(getcwd());
    dump(dirname(__FILE__));
    dump(basename(__DIR__));
    dump($dir);
    dump($files);

}

//

if ( array_key_exists('load_file', $_REQUEST) ){

    $path_file    = isset($_REQUEST['file']) ? $_REQUEST['file'] : __FILE__;
    $file = file_get_contents($path_file);
    dump($path_file);
    dump($file);

}

//

if ( array_key_exists('phpinfo', $_REQUEST) ){

    phpinfo();

}

//

if ( array_key_exists('objects', $_REQUEST) ){

    $_array = array(
        'spl_autoload_functions()'=>spl_autoload_functions(),
        'get_loaded_extensions()'=>get_loaded_extensions(),
        'get_declared_traits()'=>get_declared_traits(),
        'array_keys(get_defined_vars())'=>array_keys(get_defined_vars()),
        'get_defined_constants()'=>get_defined_constants(),
        'get_defined_functions()'=>get_defined_functions(),
        'get_declared_classes()'=>get_declared_classes(),
    );

    dump($_array);

}

//

if ( array_key_exists('database', $_REQUEST) ){

    //

    // Create connection

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

    dump($conn);

    // Check connection
    if ($conn->connect_error) {
        dump("Connection failed: " . $conn->connect_error);
    }       

    $sql = "SHOW tables";
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

    //

    // Create connection

    $mysql_database = parse_url(getenv("JAWSDB_URL")); 
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

    dump($conn);

    // Check connection
    if ($conn->connect_error) {
        dump("Connection failed: " . $conn->connect_error);
    }       

    $sql = "SHOW tables";
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

    //

}

//

    