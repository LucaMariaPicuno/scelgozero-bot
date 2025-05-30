#!/bin/bash

echo "⬇️ Scarico Chrome e Chromedriver..."

# Chrome
curl -sSL https://github.com/puppeteer/puppeteer/releases/latest/download/chrome-linux.zip -o chrome-linux.zip
unzip -q chrome-linux.zip
mv chrome-linux/* ./
chmod +x /app/chrome    # ✅ Rende chrome eseguibile

# Chromedriver
curl -sSL https://storage.googleapis.com/chrome-for-testing-public/122.0.6261.111/linux64/chromedriver-linux64.zip -o chromedriver.zip
unzip -q chromedriver.zip
mv chromedriver-linux64/chromedriver ./chromedriver
chmod +x /app/chromedriver

# Avvio server Flask
gunicorn main:app --bind 0.0.0.0:$PORT
