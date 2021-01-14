*** Settings ***
Documentation    Page object pro kosik 1

*** Variables ***
${CART1_NEXT_BTN_XPATH} =  //form[@target="save-inputs"]/div[contains(@class,"opened")][not(contains(@class,"ch2-agb"))]//div[contains(@class,"ch2-section-next")]

*** Keywords ***
Check cart1
    [Documentation]  Lorem ipsum
    wait until page contains element  ${CART1_NEXT_BTN_XPATH}