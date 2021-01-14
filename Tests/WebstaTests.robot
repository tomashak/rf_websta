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
ID100 Objednat vzorky
    [Documentation]  ID100 Tento TC se pokusi objednat jeden vzorek
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
