<?php

//

/*

chmod +x bootstrap.sh

php bootstrap.php

*/

//

$path_file = __DIR__ . '/root/app/etc/local.xml';

//var_dump(file_exists($path_file));

if( file_exists($path_file) ){
    echo 'Magento já foi instalado.';
    exit;
}

//

$base_url = 'http'.(isset($_SERVER['HTTPS'])?'s':'').'://'.$_SERVER['SERVER_NAME'] . dirname($_SERVER['REQUEST_URI']);

$base_url = $base_url . 'root';

$arg1 = $base_url;
$arg2 = '2';

$output = shell_exec("bash magento_install.sh $arg1 $arg2");

echo "<pre>$output</pre>";

//