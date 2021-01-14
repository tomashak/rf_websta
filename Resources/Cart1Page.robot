*** Settings ***
Documentation    Page object pro kosik 1

*** Variables ***
${CART1_NEXT_BTN_XPATH} =  //form[@target="save-inputs"]/div[contains(@class,"opened")][not(contains(@class,"ch2-agb"))]//div[contains(@class,"ch2-section-next")]
${CART1_PRICE_SAMPLES} =  //div[@class="ch2-product-list"]//ul/li[contains(@class, "ch2-product")]//h3[contains(text(),'Holzproben')]/following-sibling::p[@class="ch2-product-price"]
${CART1_PRICE_TOTAL} =  //form[@target="save-inputs"]/div[contains(@class,"opened")][not(contains(@class,"ch2-agb"))]//div[contains(@class,"product-sum")]

*** Keywords ***
Check cart1
    [Documentation]  Lorem ipsum
    wait until page contains element  ${CART1_NEXT_BTN_XPATH}

Check price for samples
    [Documentation]  kontrola ceny na strane kosiku 1
    [Arguments]  ${price_check}=0.00 EUR
    wait until page contains element  ${CART1_PRICE_SAMPLES}
    ${price_act} =  get text  ${CART1_PRICE_SAMPLES}
    element should contain  ${CART1_PRICE_SAMPLES}  ${price_check}  message="Cena neodpovida za vzorky, byla ${price_act}, cekali jsme ${price_check}"