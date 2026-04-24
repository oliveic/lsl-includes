<?php
// error_reporting(E_ALL);
header('Content-Type: application/json');

$me = "b858d021-4113-41df-b252-37af294dd573";

function get_sl_profile($id) {
	$urlProfile = "https://world.secondlife.com/resident/";
	$f = file_get_contents($urlProfile . $id);
	// echo $f . "\n";
	$start = strpos($f,"<title>",0)+7;
	$finish = strpos($f,"</title>",0);
	$keys = ["display","user"];
	// echo "start: $start \nfinish: $finish \n\n";
	$title = str_replace("(","",str_replace(")","",substr($f,$start,$finish-$start)));
	$arr = explode(" ",$title);
	$arr = array_combine($keys,$arr);
	$start = strpos($f,"Resident Since:")+29;
	$arr ['bithday'] = substr($f,$start,10);
	$start = strpos($f,'profile image')+28;
	$arr['piclink'] = "\n" . substr($f,$start,87);
	$arr['picid'] = substr($arr['piclink'],40,36);
	return json_encode($arr, JSON_PRETTY_PRINT);
}

// echo get_sl_profile($me);

$jsonFile = __DIR__ . "/../../sl_comm/temp.json";

$file = file_get_contents($jsonFile,JSON_PRETTY_PRINT);

echo $file;

