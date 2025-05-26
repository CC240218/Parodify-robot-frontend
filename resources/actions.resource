*** Settings ***
Documentation    metodos do projeto

Resource    ../resources/base.resource

*** Keywords ***
Search music
    [Arguments]    ${text_button}    ${title_music}
    ${id_search}    Set Variable    search-input

    Wait For Elements State            id=${id_search}    visible    6
    Fill Text                          id=${id_search}    ${title_music}
    Click                              xpath=//button[text()="${text_button}"]
    Sleep                              3
    

Found search results
    [Arguments]    ${name_music}

    Wait For Elements State            xpath=//section//h6[text()="${name_music}"]    visible    4

Notice error not Found music
    [Arguments]    ${text}
    ${css_selector}    Set Variable    .notice

    Wait For Elements State            css=${css_selector} >> text=${text}    visible    6
    Get Text                           css=${css_selector}    equal    ${text}

Play pause music
    [Arguments]    ${name_music}    ${status_music}
    ${xpath_selector}    Set Variable    
    ...    //div[contains(@class, "song")]//h6[text()="${name_music}"]/..//button[contains(@class, "${status_music}")]
  
    Wait For Elements State            xpath=${xpath_selector}    visible    4
    Click                              xpath=${xpath_selector}    
    Sleep    6

Music playing
    [Arguments]   ${name_music}    ${name_artist}    ${status_music}

    
    IF        $status_music == "pausada"  
        Set Suite Variable    ${status_music}    play

    ELSE IF    $status_music == "tocando"
        Set Suite Variable    ${status_music}    pause
       
    END

    ${xpath}    Set Variable
    ...    //div[contains(@class, "song")]//div//h6[text()="${name_music}"]/..//p[text()="${name_artist}"]/..//button[contains(@class, "${status_music}")]

     Wait For Elements State            ${xpath}    visible    6
    
Footer play pause music
    [Arguments]    ${status_music}

    Click                                xpath=//div[contains(@class, "h-24 bg-footer")]//button[contains(@class,"${status_music}")]
    Sleep    3

Should be footer music playing
    [Arguments]    ${name_music}    ${name_artist}

    Get Text    
    ...    xpath=//div[contains(@class, "footer")]//div//h6[text()="${name_music}"]/..//p[text()="${name_artist}"]    
    ...    equal    ${name_artist}
    
Music time duration footer
    [Arguments]    ${time_duration}

    Get Text                            
    ...    xpath=//div[contains(@class, "text")][text()="${time_duration}"]   
    ...    equal    ${time_duration}