*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${url_masuk}        https://alpha.surveyasia.id/login
${email}    id=email
${pass}    id=password

*** Keywords ***

Masuk website researcher
    Open Browser    ${url_masuk}    edge
    Maximize Browser Window
    Input Text    ${email}    cintakirana247@gmail.com
    Input Password    ${pass}    Cinta123@
    Click Button    xpath=/html/body/section/div/div/div[2]/div/div/form/button

Masuk website respondent
    Open Browser    ${url_masuk}    edge
    Maximize Browser Window
    Input Text    ${email}    respondent@example.com
    Input Password    ${pass}    12345678
    Click Button    xpath=/html/body/section/div/div/div[2]/div/div/form/button

TC36-> Researcher mencari survey dengan data valid
    Click Element    xpath=//div[@id='researcher-dashboard-search-bar--root']/label/i
    Input Text    xpath=//input[@id='researcher-dashboard-search-bar--input']    MOOD
    Wait Until Page Contains    MOOD
    Reload Page

TC37-> Researcher mencari survey dengan data tidak valid
    Masuk website researcher
    Click Element    xpath=//div[@id='researcher-dashboard-search-bar--root']/label/i
    Input Text    xpath=//input[@id='researcher-dashboard-search-bar--input']    000
    Wait Until Page Contains    Belum ada survey yang dibuat

TC39-> Researcher mengirim pesan kepada SurveyAsia dengan data valid
    Input Text    xpath=//textarea[@id='textarea']    Hello!
    Input Text    id=name    test1
    Input Text    id=email    cintadokumen@gmail.com
    Sleep    1s
    Click Element    xpath=//section[@id='contact-us']/div/div/div/button
    Alert Should Be Present    message has been sent
    
TC40-> Researcher mengirim pesan kepada SurveyAsia dengan data tidak valid
    Go To    https://alpha.surveyasia.id/contact
    Execute JavaScript    window.scrollTo(0, 300)
    Wait Until Element Is Visible    xpath=//textarea[@id='textarea']
    Input Text    xpath=//textarea[@id='textarea']    Hello!
    Input Text    id=name    ${EMPTY}
    Input Text    id=email    ${EMPTY}
    Sleep    2s
    Wait Until Element Is Enabled    xpath=//section[@id='contact-us']/div/div/div/button
    Click Element    xpath=//section[@id='contact-us']/div/div/div/button
    Alert Should Be Present    The name field is required.

TC41-> Researcher membagikan survey
    Click Element    xpath=//*[@id="layoutSidenav_content"]/main/div[3]/div[2]/div[5]/div/div[2]/div/div/div[2]/div/div[4]/div/div/a
    ${alert_text}=  Execute JavaScript  return window.alert ? window.alert.toString() : ''
    ${should_handle_alert}=  Run Keyword And Return Status  Should Contain  ${alert_text}  Expected Alert Text
    Run Keyword If  ${should_handle_alert}  Handle Alert  action=accept
    Click Element    xpath=//*[@id="collect-respondent"]/div/div[1]/div/div/div/span
    Alert Should Be Present

TC42-> Researcher mengganti nama link survey
    Click Element    xpath=//*[@id="btn-edit"]
    Wait Until Page Contains    Edit Tautan
    Wait Until Element Is Visible    css=input.form-control
    Click Element    css=input.form-control
    Input Text    css=input.form-control    moody-testttt
    Click Element    xpath=//*[@id="editLinkModal"]/div/div/div[3]/div/div/div/div/button[2]
    Alert Should Be Present    Slug successfully updated
    Wait Until Page Contains    Bagikan Tautan

TC38-> Researcher menghapus survey
    Go To    https://alpha.surveyasia.id/researcher/surveys
    Click Element    xpath=//a[@id='navbarDropdown']/i
    Sleep    3s
    Click Element    xpath=//button[@type = 'submit' and (text() = ' Hapus' or . = ' Hapus')]
    Alert Should Be Present
    Sleep    1s
    Reload Page

TC43-> Researcher dapat melihat hasil analisis survey
    Click Element    xpath=//*[@id="breadcrumb-contact"]/nav/ol/li[1]/a
    Click Element    xpath=//*[@id="layoutSidenav_content"]/main/div[3]/div[2]/div[5]/div/div[2]/div/div/div[2]/div/div[3]/div/div/a
    Wait Until Page Contains Element    xpath=//*[@id="surveyVizPanel"]/div[2]/div/div/h3

TC72-> Respondent mengisi survey
    Masuk website respondent
    Execute JavaScript    window.scrollTo(0, 300)
    Sleep    1s
    Run Keyword And Ignore Error    Execute JavaScript    document.querySelector(".col-12:nth-child(2) .card-body > .btn").click()
    Sleep    3s
    Wait Until Page Contains    MOOD
    Sleep    2s
    Click Element    xpath=//div[@id='sq_100']/div[2]/fieldset/div[2]/label/span
    Click Element    xpath=//input[@value='Complete']
    Wait Until Page Contains    Thank you

TC73-> Respondent mengisi survey yang sama
    Execute JavaScript    window.scrollTo(0, 300)
    Sleep    2s
    Run Keyword And Ignore Error    Execute JavaScript    document.querySelector(".col-12:nth-child(2) .card-body > .btn").click()
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    Survey sudah diisi.

TC74-> Pilih Kategori Survei Customers
    Go To    https://alpha.surveyasia.id/respondent/dashboard
    Wait Until Element Is Visible    id=category
    Execute JavaScript    document.querySelector("select#category.form-select").click()
    Select From List By Label    id=category    Customers
    Wait Until Page Contains    Test Mobile
    Reload Page

TC75-> Pilih Kategori Survei Education
    Wait Until Element Is Visible    id=category
    Execute JavaScript    document.querySelector("select#category.form-select").click()
    Select From List By Label    id=category    Education
    Wait Until Page Contains    Pemilu 2024
    Reload Page

TC76-> Pilih Kategori Survei Healthcare
    Wait Until Element Is Visible    id=category
    Execute JavaScript    document.querySelector("select#category.form-select").click()
    Select From List By Label    id=category    Healthcare
    Wait Until Page Contains    Survey Kependudukan
    Reload Page

TC77-> Pilih Kategori Survei Employee
    Wait Until Element Is Visible    id=category
    Execute JavaScript    document.querySelector("select#category.form-select").click()
    Select From List By Label    id=category    Employee
    Wait Until Page Contains    Pemetaan Misi dan Sasaran RPJMD
    Reload Page

TC78-> Pilih Kategori Survei Market Research
    Wait Until Element Is Visible    id=category
    Execute JavaScript    document.querySelector("select#category.form-select").click()
    Select From List By Label    id=category    Market Research
    Wait Until Page Contains    KEPUASAN SURVEYASIA
    Reload Page

TC79-> Cari survey valid
    Click Element    xpath=//a[@id='navbarDarkDropdownMenuLink']
    Click Element    css=.show > li:nth-child(1) > .dropdown-item
    Click Element    xpath=//input[@name='survey']
    Input Text    xpath=//input[@name='survey']    Survey Kependudukan
    SeleniumLibrary.Press Key    xpath=//input[@name='survey']    \\13
    Wait Until Page Contains    Survey Kependudukan
    Reload Page

TC80-> Cari survey tidak valid
    Click Element    xpath=//a[@id='navbarDarkDropdownMenuLink']
    Click Element    css=.show > li:nth-child(1) > .dropdown-item
    Click Element    xpath=//input[@name='survey']
    Input Text    xpath=//input[@name='survey']    00
    SeleniumLibrary.Press Key    xpath=//input[@name='survey']    \\13
    Wait Until Element Contains    css=.alert    Survey not found!