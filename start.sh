#!/bin/bash

echo "⬇️ Scarico Chrome e Chromedriver..."

# Scarica Chrome
curl -sSL https://storage.googleapis.com/chrome-for-testing-public/120.0.6099.109/linux64/chrome-linux64.zip -o chrome.zip
unzip chrome.zip
mv chrome-linux64/chrome ./chrome
chmod +x ./chrome  # 🔥 Rende eseguibile Chrome

# Scarica Chromedriver
curl -sSL https://storage.googleapis.com/chrome-for-testing-public/120.0.6099.109/linux64/chromedriver-linux64.zip -o chromedriver.zip
unzip chromedriver.zip
mv chromedriver-linux64/chromedriver ./chromedriver
chmod +x ./chromedriver  # 🔥 Rende eseguibile Chromedriver

echo "✅ Chrome e Chromedriver pronti"

# Avvia Gunicorn
exec gunicorn -b 0.0.0.0:8080 main:app
