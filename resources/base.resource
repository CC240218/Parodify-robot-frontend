*** Settings ***
Documentation    configurações e variaveis do projeto

Library    Browser
Library    JSONLibrary
Resource    ../resources/actions.resource

*** Keywords ***
Start session

    New Browser    chromium    headless=False
    New Page  https://parodify.vercel.app/

    Wait For Elements State     xpath=//span[contains(@class, logger-user)and text()="Fernando Papito" ]

Get fixture
    [Arguments]    ${fixture_name}    ${scenario}
    ${fixture }    Load Json From File    ${EXECDIR}/resources/fixtures/${fixture_name}.json    encoding=utf-8
    RETURN    ${fixture}[${scenario}]