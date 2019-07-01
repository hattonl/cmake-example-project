#!/bin/bash

echo ""
echo "1.Release      2.Debug"
echo -n "Please choose build type:   "
if [ ! -n "$1" ] ;then
    read BUILDTYPE
    echo "***************************"
else
    BUILDTYPE=$1
    echo $BUILDTYPE
fi

echo "1.DEBUG ON     2.DEBUG OFF"
echo -n "Please choose debug type:   "
if [ ! -n "$2" ] ;then
    read DEBUGTYPE
    echo "***************************"
else
    DEBUGTYPE=$2
    echo $DEBUGTYPE
fi

echo "1.make  2.make clean & make  "
echo -n "Please choose make type:   "
if [ ! -n "$3" ] ;then
    read MAKETYPE
    echo "***************************"
else
    MAKETYPE=$3
    echo $MAKETYPE
fi

echo "1.make by multiThread  2.make by singleThread   3.no make"
echo -n "Please choose make speed:   "
if [ ! -n "$4" ] ;then
    read MAKESPEED
    echo "***************************"
else
    MAKESPEED=$4
    echo $MAKESPEED
fi

case $DEBUGTYPE in
    '1')
    DEBUG_FLAG=ON
            ;;
    '2')
    DEBUG_FLAG=OFF
            ;;
    *)
    DEBUG_FLAG=ON
            ;;
esac


case $BUILDTYPE in
    '1')
    BUILDDir=Release_native
    BUILDTYPECMD=Release    
            ;;
    '2')
    BUILDDir=Debug_native
    BUILDTYPECMD=Debug
            ;;
    *)
    BUILDDir=Release_native
    BUILDTYPECMD=Release
            ;;
esac


if [ ! -d "$BUILDDir" ]; then
  mkdir $BUILDDir
fi

cd $BUILDDir

cmake -DCMAKE_BUILD_TYPE=$BUILDTYPECMD -DDEBUG_ON=$DEBUG_FLAG ../


case $MAKETYPE in
    '1')
            ;;
    '2')
    make clean
            ;;
    *)
            ;;
esac

case $MAKESPEED in
    '1')
    make -j32
            ;;
    '2')
    make
            ;;
    *)
    make	
            ;;
esac

# pack
# ...