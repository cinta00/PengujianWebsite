*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    edge
${url_daftar_researcher}        https://alpha.surveyasia.id/register/researcher
${nl}    id=nama_lengkap
${email}    id=email
${telp}    id=telp
${pass}    id=password
${cp}    id=password_confirmation
${btn_daftar}    name=submit
${checkbox}    id=checkbox


*** Keywords ***
    
TC08-> Researcher daftar dengan data valid
    Input Text    ${nl}    exresearcher
    Input Text    ${email}    tester17@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Researcher123@
    Input Password    ${cp}    Researcher123@
    Click Element    ${checkbox}
    Click Button    ${btn_daftar}
    Wait Until Page Contains    Verifikasi Email

TC09-> Researcher daftar dengan nama lengkap tidak diisi
    Open Browser    ${url_daftar_researcher}    ${BROWSER}
    Maximize Browser Window
    Input Text    ${nl}    ${EMPTY}
    Input Text    ${email}    tester17@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Researcher123@
    Input Password   ${cp}    Researcher123@
    Click Element    ${checkbox}
    Click Button    ${btn_daftar}
    ${class}=  SeleniumLibrary.Get Element Attribute  css=#nama_lengkap  class
    Should Contain  ${class}  form-control

TC10-> Researcher daftar dengan email tidak diisi
    Input Text    ${nl}    exresearcher
    Input Text    ${email}    ${EMPTY}
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Researcher123@
    Input Password    ${cp}    Researcher123@
    Click Element    ${checkbox}
    Click Button    ${btn_daftar}
    ${class}    SeleniumLibrary.Get Element Attribute  css=#email  class
    Should Contain  ${class}  form-control

TC11-> Researcher daftar dengan nomor telepon tidak diisi
    Input Text    ${nl}    exresearcher
    Input Text    ${email}    tester17@gmail.com
    Input Text    ${telp}    ${EMPTY}
    Input Password    ${pass}    Researcher123@
    Input Password    ${cp}    Researcher123@
    Click Element    ${checkbox}
    Click Button    ${btn_daftar}
    ${class}=  SeleniumLibrary.Get Element Attribute  css=#telp  class
    Should Contain  ${class}  form-control
 
TC12-> Researcher daftar dengan password tidak diisi
    Input Text    ${nl}    exresearcher
    Input Text    ${email}    tester17@gmail.com
    Input Text    ${telp}    +6281917475413    
    Input Password    ${pass}    ${EMPTY}
    Input Password    ${cp}    Researcher123@
    Click Element    ${checkbox}
    Click Button    ${btn_daftar}
    ${class}=  SeleniumLibrary.Get Element Attribute  css=#password  class
    Should Contain  ${class}  form-control

TC13-> Researcher daftar dengan confirm password tidak diisi
    Input Text    ${nl}    exresearcher
    Input Text    ${email}    tester17@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Researcher123@
    Input Password    ${cp}    ${EMPTY}
    Click Element    ${checkbox}
    Click Button    ${btn_daftar}
    ${class}=  SeleniumLibrary.Get Element Attribute  css=#password  class
    Should Contain  ${class}  form-control

TC14-> Researcher daftar dengan nama lengkap menggunakan huruf dan angka
    Go To    ${url_daftar_researcher}
    Input Text    ${nl}    exresearcher123
    Input Text    ${email}    tester17@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Researcher123@
    Input Password    ${cp}    Researcher123@
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${error_message}    Get Text    xpath=/html/body/section/div/div/div[2]/div/div/form/div[1]/div
    Wait Until Element Is Visible    xpath=/html/body/section/div/div/div[2]/div/div/form/div[1]/div
    Should Be Equal As Strings    ${error_message}    Nama Lengkap hanya boleh berisi huruf.
    Reload Page

TC15-> Researcher daftar dengan email tidak sesuai format
    Input Text    ${nl}    exresearcher
    Input Text    ${email}    examplee
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Researcher123@
    Input Password    ${cp}    Researcher123@
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${class}    SeleniumLibrary.Get Element Attribute  css=#email  class
    Should Contain  ${class}  form-control

TC16-> Researcher daftar dengan nomor telepon kurang dari 11 karakter
    Input Text    ${nl}    exresearcher
    Input Text    ${email}    tester17@gmail.com
    Input Text    ${telp}    +62819
    Input Text    ${pass}    Researcher123@
    Input Text    ${cp}    Researcher123@
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    The telp must be at least 11 characters.
    Reload Page

TC17-> Researcher daftar dengan nomor telepon menggunakan huruf
    Open Browser    ${url_daftar_researcher}    ${BROWSER}
    Maximize Browser Window
    Input Text    ${nl}    exresearcher
    Input Text    ${email}    tester18@gmail.com
    Input Text    ${telp}    exresearchernumber
    Input Text    ${pass}    Researcher123@
    Input Text    ${cp}    Researcher123@
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Element    ${btn_daftar}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    The telp must be at least 11 characters.
    Close Browser

TC18-> Researcher daftar dengan password kurang dari 8 karakter
    Input Text    ${nl}    exresearcher
    Input Text    ${email}    tester17@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Text    ${pass}    Res
    Input Text    ${cp}    Res
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    password minimal harus 8 karakter.
    Reload Page

TC19-> Researcher daftar dengan password tanpa menggunakan huruf besar,angka, dan karakter khusus
    Input Text    ${nl}    exresearcher
    Input Text    ${email}    tester17@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Text    ${pass}    researcherpassword
    Input Text    ${cp}    researcherpassword
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    password minimal harus 8 karakter dan berisi minimal 1 karakter huruf besar, 1 angka, dan 1 karakter khusus.
    Reload Page

TC20-> Researcher daftar dengan konfirmasi password tidak sama dengan password
    Input Text    ${nl}    exresearcher
    Input Text    ${email}    tester17@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Text    ${pass}    Researcher123@
    Input Text    ${cp}    Researcher1234@
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    	The password confirmation does not match.
    Reload Page

TC21-> Researcher daftar dengan email yang sudah terdaftar
    Input Text    ${nl}    exresearcher
    Input Text    ${email}    cintadokumen@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Text    ${pass}    Researcher123@
    Input Text    ${cp}    Researcher123@
    Click Element    ${checkbox}
    Wait Until Element Is Enabled    ${btn_daftar}
    Sleep    2s
    Click Button    ${btn_daftar}
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    The email has already been taken.
    Reload Page

TC22-> Researcher daftar dengan tidak mencentang box syarat dan ketentuan
    Input Text    ${nl}    exresearcher
    Input Text    ${email}    tester17@gmail.com
    Input Text    ${telp}    +6281917475413
    Input Password    ${pass}    Researcher123@
    Input Password   ${cp}    Researcher123@
    Wait Until Element Is Enabled    ${btn_daftar}
    Click Button    ${btn_daftar}
    ${class}  SeleniumLibrary.Get Element Attribute  xpath=//*[@id="checkbox"]  class
    Should Contain  ${class}  form-check-input form-check-input-orange
    Reload Page


