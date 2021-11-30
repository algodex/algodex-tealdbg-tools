#!/bin/bash
PHP=`which php`
NODE=`which node`
ALGODEX_SDK_PATH=/home/atrefonas/algodex-js/packages/algodex-sdk
$NODE load_stateful_files.js $ALGODEX_SDK_PATH 
cp /tmp/dex.teal ~/dex.teal
cp /tmp/asa_dex.teal ~/asa_dex.teal
cat txns.txt | base64 -d > group.msgp
./goal clerk inspect group.msgp  | grep 'snd\|rcv' > inspect.txt.tmp
$PHP export_addrs.php "inspect.txt.tmp"
#./tealdbg debug ~/stateless.teal --remote-debugging-port 1234 --txn ./group.msgp --painless --balance br.msgp -g 1
 #./tealdbg debug ~/asa_stateless.teal --remote-debugging-port 1234 --txn ./group.msgp --painless --balance br.msgp -g 1  
 #./tealdbg debug ~/asa_dex.teal --remote-debugging-port 1234 --txn ./group.msgp --painless --balance br.msgp -g 0
 #./tealdbg debug ~/dex.teal --remote-debugging-port 1234 --txn ./group.msgp --painless --balance br.msgp -g 0 
 ./goal clerk inspect group.msgp
 ./tealdbg debug ~/tealplayground/a.teal --remote-debugging-port 1234 --txn ./group.msgp --painless --balance br.msgp -g 0 

