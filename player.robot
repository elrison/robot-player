*** Settings ***
Library    Browser   jsextension=${EXECDIR}/resources/module.js

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Deve Tocar uma musica
            

    ${song_name}    Set Variable    Smell Like Test Script
   

    MockyMySong

    Go To      https://parodify.vercel.app/
    Get Text      css=.logged-user  contains  Fernando Papito

    ${play}    Get play button    ${song_name}
    ${pause}    Get play button    ${song_name}

    Click    ${play}

    Wait For Elements State  ${pause}  visible  2
    Wait For Elements State  ${play}  visible  175

    Sleep   3

*** Keywords ***
Start Session
    New Browser   browser=firefox  headless=False
    New Page      about:black

Finish Session
    Take Screenshot
    
Get play button
    [Arguments]    ${song_name}
    ${play}   Set Variable   
    ...    xpath=//div[contains(@class, "song")]//h6[text()="Bughium"]/..//button[contains(@class, "play")]
    
    RETURN    ${play}

Get pause button
    [Arguments]    ${song_name}
    
    ${pause}   Set Variable
    ...    xpath=//div[contains(@class, "song")]//h6[text()="Bughium"]/..//button[contains(@class, "pause")]   
    
    RETURN    ${pause}