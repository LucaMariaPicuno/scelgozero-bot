#!/bin/bash

echo "⬇️ Scarico Chrome e Chromedriver..."

# Crea una cartella temporanea per Chrome
mkdir -p /tmp/chrome
curl -sSL https://github.com/puppeteer/puppeteer/releases/latest/download/chrome-linux.zip -o chrome-linux.zip
unzip -q chrome-linux.zip -d /tmp
mv /tmp/chrome-linux/chrome /tmp/chrome/chrome
chmod +x /tmp/chrome/chrome

# Scarica Chromedriver
mkdir -p /tmp/chromedriver
curl -sSL https://storage.googleapis.com/chrome-for-testing-public/122.0.6261.111/linux64/chromedriver-linux64.zip -o chromedriver.zip
unzip -q chromedriver.zip -d /tmp/chromedriver
mv /tmp/chromedriver/chromedriver-linux64/chromedriver /tmp/chromedriver/chromedriver
chmod +x /tmp/chromedriver/chromedriver

# Avvia il server
gunicorn main:app --bind 0.0.0.0:$PORT
