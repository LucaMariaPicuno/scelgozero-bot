#!/bin/bash

echo "⬇️ Scarico Chrome e Chromedriver..."

# Crea directory
mkdir -p /tmp/chrome /tmp/chromedriver

# Scarica Chrome
curl -sSL https://github.com/puppeteer/puppeteer/releases/latest/download/chrome-linux.zip -o chrome-linux.zip
unzip -q chrome-linux.zip -d /tmp/chrome
chmod +x /tmp/chrome/chrome

# Scarica Chromedriver
curl -sSL https://storage.googleapis.com/chrome-for-testing-public/122.0.6261.111/linux64/chromedriver-linux64.zip -o chromedriver.zip
unzip -q chromedriver.zip -d /tmp/chromedriver
mv /tmp/chromedriver/chromedriver-linux64/chromedriver /tmp/chromedriver/chromedriver
chmod +x /tmp/chromedriver/chromedriver

# Avvia Gunicorn
gunicorn main:app --bind 0.0.0.0:$PORT
