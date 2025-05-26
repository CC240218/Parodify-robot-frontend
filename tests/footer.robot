*** Settings ***
Documentation         Interagindo com o footer da page

Resource              ../resources/base.resource

Task Setup       Start session
Task Teardown    Take Screenshot

*** Test Cases ***
Deve pausar a musica pelo footer da page

    [Tags]    fooplay

    ${data}    Get fixture    music    Jira_182

    Play pause music                  ${data}[title]    play
    Footer play pause music           pause
    Footer play pause music           play

Deve confirmar a musica que está tocando pelo footer

    [Tags]    fooconfirm

    ${data}    Get fixture    music    Megatest

    Play pause music                  ${data}[title]    play
    Should be footer music playing    ${data}[title]    ${data}[artist]    

Deve validar a duração da musica

    [Tags]    musicDuration

    ${data}    Get fixture    music    The_Offsprint

    Play pause music                  ${data}[title]    play
    Music time duration footer        ${data}[duration]
