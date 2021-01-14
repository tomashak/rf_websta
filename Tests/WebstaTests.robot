*** Settings ***
Documentation  Testovani objednani vzorku
Library  SeleniumLibrary
Resource  ../Resources/Cart1Page.robot
Resource  ../Resources/OrderSamplePage.robot

Test Setup  open browser  ${URL}  ${BROWSER}
Test Teardown  close browser

*** Variables ***
${URL} =  https://www.pickawood.com/de/holzmuster
${BROWSER} =  chrome



*** Test Cases ***
ID100 Objednat vzorky - pouze jeden
    [Documentation]  ID100 Tento TC se pokusi objednat jeden vzorek, cena 0
    ...  Dalsi radek dokumentace, link spec, autor
    ...  A jeste jeden, zavislosti na backend apod.
    [Tags]  smoke  regrese  cleaning
    maximize browser window
    capture page screenshot  filename=Homepage.png
    ${chbx_xpath} =     Select sample  value=335  nepovinny=novyText
    ${price} =          Price check  price_check=0.00 EUR
    OrderSamplePage.Order samples
    Cart1Page.Check cart1
    capture page screenshot  filename=Cart1Page.png
    Cart1Page.Check price for samples  price_check=0.00 EUR


ID101 Objednat vzorky - 5ks
    [Documentation]  ID100 Tento TC se pokusi objednat 5, cena bude 3 EUR
    ...  Dalsi radek dokumentace, link spec, autor
    ...  A jeste jeden, zavislosti na backend apod.
    [Tags]  smoke  regrese  cleaning
    maximize browser window
    capture page screenshot  filename=Homepage.png
    ${chbx_xpath} =     Select sample  value=335  nepovinny=novyText
    ${chbx_xpath} =     Select sample  value=477  nepovinny=novyText
    ${chbx_xpath} =     Select sample  value=478  nepovinny=novyText
    ${chbx_xpath} =     Select sample  value=341  nepovinny=novyText
    ${chbx_xpath} =     Select sample  value=33  nepovinny=novyText
    ${price} =          Price check  price_check=3.00 EUR
    OrderSamplePage.Order samples
    Cart1Page.Check cart1
    capture page screenshot  filename=Cart1Page.png
    Cart1Page.Check price for samples  price_check=3.00 EUR

ID102 Objednat vsechny vzorky 33ks
    [Documentation]  ID100 Tento TC se pokusi objednat 5, cena bude 3 EUR
    ...  Dalsi radek dokumentace, link spec, autor
    ...  A jeste jeden, zavislosti na backend apod.
    [Tags]  smoke  regrese  cleaning  debug
    maximize browser window
    capture page screenshot  filename=Homepage.png
    Select all samples
    ${price} =          Price check  price_check=102.00 EUR
    OrderSamplePage.Order samples
    Cart1Page.Check cart1
    capture page screenshot  filename=Cart1Page.png
    Cart1Page.Check price for samples  price_check=102.00 EUR