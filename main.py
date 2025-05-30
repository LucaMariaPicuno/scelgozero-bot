import csv
import time
import traceback
import requests
from flask import Flask
import undetected_chromedriver as uc
from selenium.webdriver.common.by import By

app = Flask(__name__)

CREDENTIALS_URL = "https://drive.google.com/uc?export=download&id=1vEr4c464GRxN_hSvXXW6hP-so5l7KMrG"
CHROMEDRIVER_PATH = "/app/chromedriver"
BINARY_LOCATION = "/app/chrome"

def scarica_credentials():
    try:
        response = requests.get(CREDENTIALS_URL)
        response.raise_for_status()
        with open("credentials.csv", "wb") as f:
            f.write(response.content)
        print("✅ CSV scaricato")
    except Exception as e:
        print("❌ Errore nel download CSV:", e)

def automatizza_login(username, password):
    print(f"🟢 Avvio per: {username}")
    try:
        options = uc.ChromeOptions()
        options.binary_location = BINARY_LOCATION
        options.add_argument("--headless=new")
        options.add_argument("--no-sandbox")
        options.add_argument("--disable-dev-shm-usage")

        driver = uc.Chrome(driver_executable_path=CHROMEDRIVER_PATH, options=options)
        driver.get("https://io.scelgozero.it")
        time.sleep(5)
        driver.find_element(By.XPATH, '//input[@placeholder="Numero di cellulare"]').send_keys(username)
        time.sleep(1)
        driver.find_element(By.XPATH, '//input[@placeholder="PIN"]').send_keys(password)
        time.sleep(1)
        driver.find_element(By.XPATH, '//button[contains(text(), "Entra")]').click()
        time.sleep(6)
        try:
            driver.find_element(By.XPATH, "//div[contains(text(), 'APRI')]").click()
            print("✅ Clic su APRI")
        except:
            print("⚠️ Nessun APRI")
        time.sleep(3)
        try:
            driver.find_element(By.XPATH, "//button[contains(text(), 'OK')]").click()
            print("✅ Clic su OK")
        except:
            print("⚠️ Nessun OK")
        time.sleep(3)
        try:
            driver.find_element(By.XPATH, '//img[@src="/img/appicons/svg/gift/gift-0.svg"]').click()
            print("✅ Pacco grigio cliccato")
        except:
            print("⚠️ Pacco grigio non trovato")
        time.sleep(3)
        driver.quit()
    except Exception as e:
        print("❌ Errore a livello globale:", e)
        traceback.print_exc()

@app.route("/")
def index():
    return "✅ Bot attivo - aggiungi /run per eseguire."

@app.route("/run")
def run_bot():
    scarica_credentials()
    with open("credentials.csv", newline='') as f:
        reader = csv.DictReader(f)
        for row in reader:
            automatizza_login(row['username'], row['password'])
    return "✅ Esecuzione completata."
