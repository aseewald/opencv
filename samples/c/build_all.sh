#!/bin/sh

if [ $# -gt 0 ] ; then
    base=`basename $1 .c`
    echo "compiling $base"
    gcc -L /opt/local/lib -ggdb `pkg-config opencv --cflags --libs` $base.c -o $base
else
    for i in *.c; do
        echo "compiling $i"
        gcc -L /opt/local/lib -ggdb `pkg-config --cflags opencv` -o `basename $i .c` $i `pkg-config --libs opencv`;
    done
    for i in *.cpp; do
        echo "compiling $i"
        g++ -L /opt/local/lib -ggdb `pkg-config --cflags opencv` -o `basename $i .cpp` $i `pkg-config --libs opencv`;
    done
fi
