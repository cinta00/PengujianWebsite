*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    edge
${url_daftar_respondent}        https://alpha.surveyasia.id/register/respondent
${nl}    id=nama_lengkap
${email}    id=email
${telp}    id=telp
${pass}    id=password
${cp}    id=password_confirmation
${btn_daftar}    name=submit
${checkbox}    id=checkbox


*** Keywords ***
    
TC44-> Respondent daftar dengan data valid
    Go To    ${url_daftar_respondent}
    Input Text    ${nl}    exrespondent
    Input Text    ${email}    tester20@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Respondent123@
    Input Password    ${cp}    Respondent123@
    Click Element    ${checkbox}
    Click Button    ${btn_daftar}
    Wait Until Page Contains    Verifikasi Email

TC45-> Respondent daftar dengan nama lengkap tidak diisi
    Open Browser    ${url_daftar_respondent}    ${BROWSER}
    Maximize Browser Window
    Input Text    ${nl}    ${EMPTY}
    Input Text    ${email}    tester20@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Respondent123@
    Input Password   ${cp}    Respondent123@
    Click Element    ${checkbox}
    Click Button    ${btn_daftar}
    ${class}=  SeleniumLibrary.Get Element Attribute  css=#nama_lengkap  class
    Should Contain  ${class}  form-control

TC46-> Respondent daftar dengan email tidak diisi
    Input Text    ${nl}    exrespondent
    Input Text    ${email}    ${EMPTY}
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Respondent123@
    Input Password    ${cp}    Respondent123@
    Click Element    ${checkbox}
    Click Button    ${btn_daftar}
    ${class}    SeleniumLibrary.Get Element Attribute  css=#email  class
    Should Contain  ${class}  form-control

TC47-> Respondent daftar dengan nomor telepon tidak diisi
    Input Text    ${nl}    exrespondent
    Input Text    ${email}    tester20@gmail.com
    Input Text    ${telp}    ${EMPTY}
    Input Password    ${pass}    Respondent123@
    Input Password    ${cp}    Respondent123@
    Click Element    ${checkbox}
    Click Button    ${btn_daftar}
    ${class}=  SeleniumLibrary.Get Element Attribute  css=#telp  class
    Should Contain  ${class}  form-control
 
TC48-> Respondent daftar dengan password tidak diisi
    Input Text    ${nl}    exrespondent
    Input Text    ${email}    tester20@gmail.com
    Input Text    ${telp}    +6281917475413    
    Input Password    ${pass}    ${EMPTY}
    Input Password    ${cp}    Respondent123@
    Click Element    ${checkbox}
    Click Button    ${btn_daftar}
    ${class}=  SeleniumLibrary.Get Element Attribute  css=#password  class
    Should Contain  ${class}  form-control

TC49-> Respondent daftar dengan confirm password tidak diisi
    Input Text    ${nl}    exrespondent
    Input Text    ${email}    tester20@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Respondent123@
    Input Password    ${cp}    ${EMPTY}
    Click Element    ${checkbox}
    Click Button    ${btn_daftar}
    ${class}=  SeleniumLibrary.Get Element Attribute  css=#password  class
    Should Contain  ${class}  form-control

TC50-> Respondent daftar dengan nama lengkap menggunakan huruf dan angka
    Go To    ${url_daftar_respondent}
    Input Text    ${nl}    exrespondent123
    Input Text    ${email}    tester20@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Respondent123@
    Input Password    ${cp}    Respondent123@
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${error_message}    Get Text    xpath=/html/body/section/div/div/div[2]/div/div/form/div[1]/div
    Wait Until Element Is Visible    xpath=/html/body/section/div/div/div[2]/div/div/form/div[1]/div
    Should Be Equal As Strings    ${error_message}    Nama Lengkap hanya boleh berisi huruf.
    Reload Page

TC51-> Respondent daftar dengan nama lengkap menggunakan angka
    Input Text    ${nl}    12345678
    Input Text    ${email}    tester20@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Respondent123@
    Input Password    ${cp}    Respondent123@
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${error_message}    Get Text    xpath=/html/body/section/div/div/div[2]/div/div/form/div[1]/div
    Wait Until Element Is Visible    xpath=/html/body/section/div/div/div[2]/div/div/form/div[1]/div
    Should Be Equal As Strings    ${error_message}    Nama Lengkap hanya boleh berisi huruf.
    Reload Page

TC52-> Respondent daftar dengan email tidak sesuai format
    Input Text    ${nl}    exrespondent
    Input Text    ${email}    examplee
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Respondent123@
    Input Password    ${cp}    Respondent123@
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${class}    SeleniumLibrary.Get Element Attribute  css=#email  class
    Should Contain  ${class}  form-control
    Reload Page

TC53-> Respondent daftar dengan nomor telepon kurang dari 11 karakter
    Input Text    ${nl}    exrespondent
    Input Text    ${email}    tester20@gmail.com
    Input Text    ${telp}    +62819
    Input Text    ${pass}    Respondent123@
    Input Text    ${cp}    Respondent123@
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    The telp must be at least 11 characters.
    Reload Page

TC54-> Respondent daftar dengan nomor telepon menggunakan huruf
    Open Browser    ${url_daftar_respondent}    ${BROWSER}
    Maximize Browser Window
    Input Text    ${nl}    exrespondent
    Input Text    ${email}    tester21@gmail.com
    Input Text    ${telp}    exrespondentnumber
    Input Text    ${pass}    Respondent123@
    Input Text    ${cp}    Respondent123@
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Element    ${btn_daftar}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    The telp must be at least 11 characters.
    Close Browser

TC55-> Respondent daftar dengan password kurang dari 8 karakter
    Go To    ${url_daftar_respondent}
    Input Text    ${nl}    exrespondent
    Input Text    ${email}    tester20@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Text    ${pass}    Res
    Input Text    ${cp}    Res
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    password minimal harus 8 karakter.
    Reload Page

TC56-> Respondent daftar dengan password tanpa menggunakan huruf besar,angka, dan karakter khusus
    Input Text    ${nl}    exrespondent
    Input Text    ${email}    tester20@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Text    ${pass}    respondentpassword
    Input Text    ${cp}    respondentpassword
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    password minimal harus 8 karakter dan berisi minimal 1 karakter huruf besar, 1 angka, dan 1 karakter khusus.
    Reload Page

TC57-> Respondent daftar dengan konfirmasi password tidak sama dengan password
    Input Text    ${nl}    exrespondent
    Input Text    ${email}    tester20@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Text    ${pass}    Respondent123@
    Input Text    ${cp}    Respondent1234@
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    	The password confirmation does not match.
    Reload Page

TC58-> Respondent daftar dengan email yang sudah terdaftar
    Input Text    ${nl}    exrespondent
    Input Text    ${email}    cintaarsyi04@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Text    ${pass}    Respondent123@
    Input Text    ${cp}    Respondent123@
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Sleep    2s
    Click Button    ${btn_daftar}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    The email has already been taken.
    Reload Page

TC59-> Respondent daftar dengan tidak mencentang box syarat dan ketentuan
    Input Text    ${nl}    exrespondent
    Input Text    ${email}    tester20@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Respondent123@
    Input Password   ${cp}    Respondent123@
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${class}  SeleniumLibrary.Get Element Attribute  xpath=//*[@id="checkbox"]  class
    Should Contain  ${class}  form-check-input form-check-input-orange
    Reload Page


