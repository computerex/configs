id=$(xinput | grep TouchPad | cut -d '=' -f 2 | cut -f 1)
xinput set-button-map $id 1 1 3 4 5 6 7
