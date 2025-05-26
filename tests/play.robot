*** Settings ***
Documentation    Interagindo com as musicas da page

Resource    ../resources/base.resource

Task Setup        Start session
Task Teardown     Take Screenshot

*** Test Cases ***
Deve dar play na musica

    [Tags]    play

    ${data}    Get fixture    music   Jira_182

    Play pause music    ${data}[title]    play

Deve verificar se a musica esta tocando

    [Tags]    playconfirm

    ${data}    Get fixture    music   Megatest

    Play pause music     ${data}[title]    play
    Music playing        ${data}[title]    ${data}[artist]   tocando

