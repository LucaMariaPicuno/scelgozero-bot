#!/bin/bash
chmod +x chrome
chmod +x chromedriver
gunicorn main:app --bind 0.0.0.0:$PORT
