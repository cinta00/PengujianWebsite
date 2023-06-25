*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://alpha.surveyasia.id/register/researcher

*** Test Cases ***
#Daftar dengan data valid
TC01
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=nama_lengkap    ${EMPTY}
    Input Text    id=email    johnde@example.com
    Input Text    id=telp    +6281234567890
    Input Password    id=password    Mypassword123@
    Input Password    id=password_confirmation    Mypassword123@
    Click Element    id=checkbox
    Click Button    name=submit
    ${class}=  Get Element Attribute  css=#nama_lengkap  class
    Should Contain  ${class}  form-control
    Close Browser
TC02
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=nama_lengkap    John
    Input Text    id=email    johndoe@example.com
    Input Text    id=telp    +6281234567890
    Input Password    id=password    Mypassword123@
    Input Password    id=password_confirmation    Mypassword123@
    Click Element    id=checkbox
    Click Button    name=submit
    Wait Until Page Contains    Verifikasi Email
    Close Browser

#Daftar dengan mengisi nama lengkap tidak valid
TC03
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=nama_lengkap    jj123
    Input Text    id=email    johndoie@example.com
    Input Text    id=telp    +6281234567890
    Input Password    id=password    Mypassword123@
    Input Password    id=password_confirmation    Mypassword123@
    Click Element    id=checkbox
    Click Button    name=submit
    ${error_message}    Get Text    xpath=/html/body/section/div/div/div[2]/div/div/form/div[1]/div
    Should Be Equal As Strings    ${error_message}    Nama Lengkap hanya boleh berisi huruf.
    Close Browser

TC04
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=nama_lengkap    example
    Input Text    id=email    example
    Input Text    id=telp    +6281234567890
    Input Password    id=password    Mypassword123@
    Input Password    id=password_confirmation    Mypassword123@
    Click Element    id=checkbox
    Click Button    name=submit
    ${class}=  Get Element Attribute  css=#email  class
    Should Contain  ${class}  form-control
    Close Browser
