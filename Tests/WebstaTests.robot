*** Settings ***
Documentation  Testovani objednani vzorku
Library  SeleniumLibrary

Test Setup  open browser  ${URL}  ${BROWSER}
Test Teardown  close browser

*** Variables ***
${URL} =  https://www.pickawood.com/de/holzmuster
${BROWSER} =  chrome
${WOOD_SAMPLE_XPATH_CHBX} =  //form[@id="holzprobenForm"]//input[@name="phases[]"][@value="335"]
${PRICE_OF_WOOD_SAMPLES_XPATH} =  //form[@id="holzprobenForm"]/aside//span[@id="price_of_wood_samples"]
${BUTTON_IN_DEN_WARENKORB_XPATH} =  //form[@id="holzprobenForm"]/aside/button[text()="In den Warenkorb"][@type="submit"]
${CART1_NEXT_BTN_XPATH} =  //form[@target="save-inputs"]/div[contains(@class,"opened")][not(contains(@class,"ch2-agb"))]//div[contains(@class,"ch2-section-next")]

*** Test Cases ***
Objednat vzorky
    maximize browser window
    wait until page contains element  ${WOOD_SAMPLE_XPATH_CHBX}
    capture page screenshot  filename=Homepage.png
    click element  ${WOOD_SAMPLE_XPATH_CHBX}
    element should contain  ${PRICE_OF_WOOD_SAMPLES_XPATH}  0.00 EUR  message="Cena neodpovida, ma byt nula do tri vzorku"
    click element  ${BUTTON_IN_DEN_WARENKORB_XPATH}
    wait until page contains element  ${CART1_NEXT_BTN_XPATH}
    capture page screenshot  filename=Cart1Page.png