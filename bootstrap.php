<?php

//

/*

chmod +x bootstrap.sh

php bootstrap.php

*/

//

$base_url = 'http'.(isset($_SERVER['HTTPS'])?'s':'').'://'.$_SERVER['SERVER_NAME'] . dirname($_SERVER['REQUEST_URI']);

$base_url = $base_url . 'root';

$arg1 = $base_url;
$arg2 = '2';

$output = shell_exec("bash -x bootstrap.sh $arg1 $arg2");

echo "<pre>$output</pre>";

//

/*

$url = "";

$data = array('bash'=>$output);
$data = print_r( $data, true );

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POST, 0);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
$response = curl_exec($ch);

$ern = curl_errno($ch);
$err = curl_error($ch);
$status = curl_getinfo($ch);
$httpStatus = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$version = curl_version();

echo '<pre>';

print_r($response);
print_r($httpStatus);

*/

//