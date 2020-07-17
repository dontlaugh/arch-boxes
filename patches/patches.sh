#!/bin/bash

make_patch () {
    git diff $1
}

case $1 in
    make)
        echo "generating patch files ..."
        make_patch "../local.json" > "local.json.patch"
        make_patch "../provision/postinstall.sh" > "provision_postinstall.sh.patch"
        make_patch "../provision/qemu.sh" > "provision_qemu.sh.patch"
    ;;
    apply)
        echo "applying a patch"
    ;;
    *)
        echo "missing argument; one of: make, apply"
        exit 1
    ;;
esac
