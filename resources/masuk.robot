*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    edge
${url_masuk}        https://alpha.surveyasia.id/login
${email}    id=email
${pass}    id=password
${btn_masuk}    xpath=/html/body/section/div/div/div[2]/div/div/form/button

*** Keywords ***

TC01-> Masuk dengan data valid
    Input Text    ${email}    cintadokumen@gmail.com
    Input Password    ${pass}    Researcher123@
    Click Element    ${btn_masuk}
    Wait Until Page Contains    Beranda

Masuk Respondent
    Open Browser    ${url_masuk}    ${BROWSER}
    Maximize Browser Window
    Input Text    ${email}    cintaarsyi04@gmail.com
    Input Password    ${pass}    Respondent123@
    Click Element    ${btn_masuk}
    Wait Until Page Contains    Home
    

TC02-> Masuk dengan email yang belum terdaftar
    Open Browser    ${url_masuk}    ${BROWSER}
    Maximize Browser Window
    Input Text    ${email}    cintadokum@gmail.com
    Input Password    ${pass}    Researcher123@
    Click Element    ${btn_masuk}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    These credentials do not match our records.

TC03-> Masuk dengan email tidak sesuai format
    Input Text    ${email}    cintadok
    Input Password    ${pass}    Researcher123@
    Click Element    ${btn_masuk}
    ${class}    SeleniumLibrary.Get Element Attribute    xpath=//*[@id="email"]    class
    Should Contain  ${class}  form-control

TC04-> Masuk dengan password tidak tepat
    Input Text    ${email}    cintadokumen@gmail.com
    Input Password    ${pass}    Researcher
    Click Element    ${btn_masuk}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    These credentials do not match our records.
 

TC05-> Masuk dengan tidak mengisi email dan password
    Input Text    ${email}    ${EMPTY}
    Input Password    ${pass}    ${EMPTY}
    Click Element    ${btn_masuk}
    ${class}    SeleniumLibrary.Get Element Attribute  css=#email  class
    Should Contain  ${class}  form-control

TC06-> Researcher keluar dari akun
    Click Element    xpath=//a[contains(text(),'exresearcher')]
    Click Element    xpath=//button[contains(.,' Keluar')]
    Wait Until Page Contains    Coba Sekarang
    Sleep    1s
    Close Browser
TC07-> Respondent keluar dari akun
    Masuk Respondent
    Click Element    xpath=//a[contains(text(),'exRespondent')]
    Click Element    xpath=//button[contains(.,' Keluar')]
    Wait Until Page Contains    Coba Sekarang
    
