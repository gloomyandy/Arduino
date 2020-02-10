Arduino core for ESP8266 Support for Duet WiFi Moduke
===========================================

# Arduino Core ESP8266 SDK support for the Duet WiFi Socket Server

This branch provides a way to build the Arduino ESP8266 SDK for use with
the Duet WiFi Socket Server firmware. It basically adds cutom build files
to allow a slightly modifed version of the standard SDK to be built. It also
builds the Arduino Core as a library to make it easier to use with the Socket
Server build.

NOTE: Two versions of the SDK are built one for use with V2.X of the ESP8266 SDK
and one for use with V3.X of the official Espressif SDK libraries.

It is intended that this will provide an easier way to track updates to the
SDK.

# Build Instructions

Checkout the this branch on your computer

    git clone https://github.com/gloomyandy/Arduino.git
    cd Arduino
    git checkout DuetWiFiESP2866Core

Install the build tools

    cd Arduino
    git submodule update --init
    cd tools
    python get.py

Make the libraries

    cd ..
    make install

