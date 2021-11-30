<?php

$filename = $argv[1];
$addresses = [];
if ($file = fopen($filename, "r")) {
  while(!feof($file)) {
    $line = fgets($file);
    preg_match('/.*\"([^\"]+)\"/', $line, $matches);
    if (count($matches) > 0) {
      $addr = $matches[1];
      $addresses[$addr] = 1;
    }
  }
  fclose($file);
}
$addresses = array_keys($addresses);
var_dump($addresses);
$count = 0;
$catText = '';
foreach ($addresses as $address) {
  $count++;
  `./goal account dump -a $address -o br$count.msgp`;
  $catText .= 'br'.$count.'.msgp ';
}
`cat $catText > br.msgp`
?>

