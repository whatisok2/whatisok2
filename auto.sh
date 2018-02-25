#!/bin/sh

expect -c "
set timeout 5
spawn bin/xmr-stak 

expect \"'aeon'\"
send \"monero\n\"

expect \"pool.usxmrpool.com:3333\"
send \"pool.supportxmr.com:3333\n\"

expect \"(wallet address or pool login):\"
send \"48TxcrWCLKx5mttjjaD9dHYWmz5bPfxQfUVNv7LJ1pwaVAfUY4H9xNzRr2eoH6XwZW6ewp1pxWX4QdmYAcgf9SAw6m62BT5\n\"

expect \"(mostly empty or x):\"
send \"`date`\n\"

expect \"(y/N)\"
send \"N\n\"

expect \"(y/n)\"
send \"y\n\"

expect \"(y/n)\"
send \"n\n\"
send \"sleep 5\n\"

expect \"$\"
"
