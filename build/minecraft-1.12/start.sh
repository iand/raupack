#!/bin/sh

# Setup forge with  installer jar from http://files.minecraftforge.net/
# java -jar forge-1.12.2-14.23.4.2705-installer.jar --installServer


MCVER="1.12.2"
JARFILE="minecraft_server.${MCVER}.jar"
FORGEJAR="forge-1.12.2-14.23.5.2854.jar"

JAVACMD="java"
MIN_RAM="4G"        # -Xms
MAX_RAM="12G"       # -Xmx
JAVA_PARAMETERS="-XX:NewRatio=2 -XX:SoftRefLRUPolicyMSPerMB=2048 -XX:+CMSParallelRemarkEnabled -XX:+UseParNewGC -XX:+DisableExplicitGC -Xnoclassgc -oss4M -ss4M -XX:+UseFastAccessorMethods -XX:CMSInitiatingOccupancyFraction=90 -XX:+UseConcMarkSweepGC -XX:UseSSE=4 -XX:ParallelGCThreads=4 -XX:+AggressiveOpts"

start_server() {
    "$JAVACMD" -server -Xms${MIN_RAM} -Xmx${MAX_RAM} ${JAVA_PARAMETERS} -jar ${FORGEJAR} nogui
}

echo eula=true > eula.txt

echo "Starting server"
rm -f autostart.stamp
start_server

while [ -e autostart.stamp ] ; do
    rm -f autostart.stamp
    echo "If you want to completely stop the server process now, press Ctrl+C before the time is up!"
    for i in 5 4 3 2 1; do
        echo "Restarting server in $i"
        sleep 1
    done
    echo "Rebooting now!"
    start_server
    echo "Server process finished"
done
