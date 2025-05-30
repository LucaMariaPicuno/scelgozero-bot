#!/bin/bash

echo "⬇️ Scarico Chrome e Chromedriver..."

curl -sSL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o chrome.deb
ar x chrome.deb
tar -xf data.tar.xz
mv ./opt/google/chrome/chrome ./chrome
chmod +x chrome  # <--- QUESTA RIGA È FONDAMENTALE

curl -sSL https://storage.googleapis.com/chrome-for-testing-public/120.0.6099.109/linux64/chromedriver-linux64.zip -o chromedriver.zip
unzip chromedriver.zip
mv chromedriver-linux64/chromedriver ./chromedriver
chmod +x chromedriver

echo "✅ Chrome e Chromedriver pronti"

exec gunicorn -b 0.0.0.0:8080 main:app
