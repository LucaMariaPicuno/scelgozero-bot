#!/bin/bash

echo "⬇️ Scarico Chrome e Chromedriver..."

# Scarica Chrome
curl -sSL https://github.com/puppeteer/puppeteer/releases/latest/download/chrome-linux.zip -o chrome-linux.zip
unzip -q chrome-linux.zip
cp chrome-linux/chrome /app/chrome
chmod +x /app/chrome

# Scarica Chromedriver
curl -sSL https://storage.googleapis.com/chrome-for-testing-public/122.0.6261.111/linux64/chromedriver-linux64.zip -o chromedriver.zip
unzip -q chromedriver.zip
mv chromedriver-linux64/chromedriver /app/chromedriver
chmod +x /app/chromedriver

# Avvia il server
gunicorn main:app --bind 0.0.0.0:$PORT
