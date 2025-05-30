#!/bin/bash

echo "⬇️ Scarico Chrome e Chromedriver..."

# Scarica Chrome
curl -sSL https://storage.googleapis.com/chrome-for-testing-public/120.0.6099.109/linux64/chrome-linux64.zip -o chrome.zip
unzip -o chrome.zip
mv -f chrome-linux64/chrome ./chrome
chmod 755 ./chrome
echo "✔️ Chrome reso eseguibile"

# Scarica Chromedriver
curl -sSL https://storage.googleapis.com/chrome-for-testing-public/120.0.6099.109/linux64/chromedriver-linux64.zip -o chromedriver.zip
unzip -o chromedriver.zip
mv -f chromedriver-linux64/chromedriver ./chromedriver
chmod 755 ./chromedriver
echo "✔️ Chromedriver reso eseguibile"

# Verifica permessi
ls -l ./chrome
ls -l ./chromedriver

# Avvia il server Flask
exec gunicorn -b 0.0.0.0:8080 main:app
