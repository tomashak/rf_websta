*** Settings ***
Documentation    Page object pro stranku objednani vzorku
Library  String

*** Variables ***
${WOOD_SAMPLE_XPATH_CHBX} =  //form[@id="holzprobenForm"]//input[@name="phases[]"][@value="XXX"]
${PRICE_OF_WOOD_SAMPLES_XPATH} =  //form[@id="holzprobenForm"]/aside//span[@id="price_of_wood_samples"]
${BUTTON_IN_DEN_WARENKORB_XPATH} =  //form[@id="holzprobenForm"]/aside/button[text()="In den Warenkorb"][@type="submit"]

*** Keywords ***
Select sample
    [Documentation]  Vybere definovany checkbox dle vstupu
    [Arguments]  ${value}  ${nepovinny}=neco
    ${final_xpath} =  replace string  ${WOOD_SAMPLE_XPATH_CHBX}  XXX  ${value}
    wait until page contains element  ${final_xpath}
    click element  ${final_xpath}
    [Return]  ${final_xpath}

Price check
    [Documentation]  Lorem ipsum
    [Arguments]  ${price_check}=0.00 EUR
    ${price_act} =  get text  ${PRICE_OF_WOOD_SAMPLES_XPATH}
    element should contain  ${PRICE_OF_WOOD_SAMPLES_XPATH}  ${price_check}  message="Cena neodpovida za vzorky, byla ${price_act}, cekali jsme ${price_check}"
    [Return]  ${price_act}

Order samples
    [Documentation]  Click on button
    wait until page contains element  ${BUTTON_IN_DEN_WARENKORB_XPATH}
    click element  ${BUTTON_IN_DEN_WARENKORB_XPATH}