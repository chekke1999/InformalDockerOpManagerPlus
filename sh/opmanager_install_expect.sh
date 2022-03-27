#!/usr/bin/env expect
set timeout 120
set path $env(INSTALL_PATH)
set web $env(WEB_PORT)
set netflow $env(NETFLOW_PORT)

if {[string length $path] != 0} {
    append path $path " " "\n"
} else {
    set path "\n"
}
if {[string length $web] != 0} {
    append web $web " " "\n"
} else {
    set web "\n"
}
if {[string length $netflow] != 0} {
    append netflow $netflow " " "\n"
} else {
    set netflow "\n"
}

spawn "/tmp/ManageEngine_OpManager_Plus_64bit.bin"


expect {
    "PRESS <ENTER> TO CONTINUE:" {
        send "\n"
        exp_continue
    } "DO YOU ACCEPT THE TERMS OF THIS LICENSE AGREEMENT? (Y/N):" {
        send "y\n"
    } 
}
expect "Do you want to register for technical support?(Y/N) (Default: Y):"
send "n\n"
expect "ENTER AN ABSOLUTE PATH, OR PRESS <ENTER> TO ACCEPT THE DEFAULT"
send "${path}"
expect "Enter the Web Server Port Number (Default: 8060):"
send "${web}"
expect "Enter the Netflow Listener Port  (Default: 9996):"
send "${netflow}"
expect {
    "PRESS <ENTER> TO CONTINUE:" {
        send "\n"
        exp_continue
    } "Technical support :" {
        exit
    }
}