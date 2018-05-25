list_networks() {
    nmcli device wifi list | awk '{if (NR!=1) {print $1 $4}}'
}

list_networks
