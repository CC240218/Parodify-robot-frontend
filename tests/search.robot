*** Settings ***
Documentation    Testes em uma replica do spotify

Resource    ../resources/base.resource

Task Setup        Start session
Task Teardown     Take Screenshot

*** Test Cases ***
Deve pesquisar uma musica

    [Tags]    search

    ${data}    Get fixture    music    The_Offsprint
    Search music                    Buscar    ${data}[title]
    Found search results                      ${data}[title]    

Deve notificar quando não há resultado
    
    [Tags]    seaNotice

    ${data}    Get fixture    music    Not_Found

    Search music                    Buscar    ${data}[title]
    Notice error not Found music              ${data}[notice]
