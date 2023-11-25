#!/bin/bash
set -e

shell_path=$(cd `dirname $0`; pwd)
cd $shell_path

bash -x ./install_deps.sh
param="param: ";
build_path="unkonw"
prefix=""
mode="release"
redirect=""
jobs=$(cat /proc/cpuinfo |grep processor|wc -l)

while [ $# -ge 2 ] ; do
        case "$1" in
                -build_path) param="${param} $1=$2," build_path=$2;  shift 2;;
                -prefix)     param="${param} $1=$2," prefix=$2;      shift 2;;
                -mode)       param="${param} $1=$2," mode=$2;        shift 2;;
                -redirect)   param="${param} $1=$2," redirect=$2;        shift 2;;
                *) echo "unknown parameter $1." ; exit 1 ; break;;
        esac
done

echo $param" parameter analysis done:(build_path:$build_path prefix:$prefix mode:$mode redirect:$redirect jobs:$jobs)."

pro_cmake_path="build"
release_flag=""
if [ "X$mode" = "Xrelease" ]; then
    echo "begin release"
    pro_cmake_path="release"
    release_flag="-DDEBUG_MODE=off"
fi

chmod 744 vsf_findlibs.sh
make -j8