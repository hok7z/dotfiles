#!/bin/bash

url="https://youtu.be/5qap5aO4i9A"

pkill -f $url || mpv --shuffle --no-video "$url" 
