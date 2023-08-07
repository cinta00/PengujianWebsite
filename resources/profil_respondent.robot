*** Settings ***
Library    SeleniumLibrary
Resource    masuk.robot

*** Variables ***

${BROWSER}    edge
${url_masuk}        https://alpha.surveyasia.id/login
${email}    id=email
${pass}    id=password
${NIK}    id=nik
${nl}    id=nama_lengkap
${perempuan}    id=perempuan
${tempat_lahir}    id=birth_place
${tgl_lahir}    id=birth_date
${job}    id=job
${provinsi}    id=province
${kota}    id=city
${kec}    id=district
${alamat}    id=address
${kode_pos}    id=postal_code
${btn_simpan}    Xpath=/html/body/section/div[2]/form/div[4]/div/button
${btn_profil}    Xpath=//*[@id="navbarNav"]/ul/li/ul/li[1]/a
${btn_edit}    Xpath=/html/body/section[1]/div[2]/div/a/svg
${nav_profil}    Xpath=//*[@id="navbarDropdown"]

*** Keywords ***
Masuk website
    Open Browser    ${url_masuk}    chrome
    Maximize Browser Window
    Input Text    ${email}    cintaarsyi04@gmail.com
    Input Password    ${pass}    Respondent123@
    Click Button    xpath=/html/body/section/div/div/div[2]/div/div/form/button

TC60-> Respondent memperbarui profil
    Go To    https://alpha.surveyasia.id/profile
    Click Element    css=.fa-edit
    Input Text    ${NIK}    1234567891234567
    Input Text    ${nl}    exRespondent
    Click Element    ${perempuan}
    Input Text    ${tempat_lahir}    Tegal
    Input Text    ${tgl_lahir}    10/04/2000
    Input Text    ${job}    mahasiswa
    Input Text    ${provinsi}    DKI Jakarta
    Input Text    ${kota}    jakarta selatan
    Input Text    ${kec}    mampang prapatan
    Input Text    ${alamat}    jalan poncol jaya
    Input Text    ${kode_pos}    12710
    Element Should Be Enabled    xpath=/html/body/section/div[2]/form/div[4]/div/button
    Execute JavaScript    document.querySelector("button.btn.btn-orange.px-5.float-end").click()
    Wait Until Page Contains    exRespondent

TC61-> Respondent memperbarui profil dengan mengisi nama lengkap menggunakan angka
    Go To    https://alpha.surveyasia.id/profile
    Click Element    css=.fa-edit
    Input Text    ${NIK}    1234567891234567
    Input Text    ${nl}    12345678
    Click Element    ${perempuan}
    Input Text    ${tempat_lahir}    Tegal
    Input Text    ${tgl_lahir}    10/04/2000
    Input Text    ${job}    mahasiswa
    Input Text    ${provinsi}    DKI Jakarta
    Input Text    ${kota}    jakarta selatan
    Input Text    ${kec}    mampang prapatan
    Input Text    ${alamat}    jalan poncol jaya
    Input Text    ${kode_pos}    12710
    Element Should Be Enabled    xpath=/html/body/section/div[2]/form/div[4]/div/button
    Execute JavaScript    document.querySelector("button.btn.btn-orange.px-5.float-end").click()
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    Nama Lengkap hanya boleh berisi huruf.

TC62-> Respondent memperbarui profil dengan tidak mengisi NIK
    Go To    https://alpha.surveyasia.id/profile
    Click Element    css=.fa-edit
    Input Text    ${NIK}    ${EMPTY}
    Input Text    ${nl}    exRespondent
    Click Element    ${perempuan}
    Input Text    ${tempat_lahir}    Tegal
    Input Text    ${tgl_lahir}    10/04/2000
    Input Text    ${job}    mahasiswa
    Input Text    ${provinsi}    DKI Jakarta
    Input Text    ${kota}    jakarta selatan
    Input Text    ${kec}    mampang prapatan
    Input Text    ${alamat}    jalan poncol jaya
    Input Text    ${kode_pos}    12710
    Element Should Be Enabled    xpath=/html/body/section/div[2]/form/div[4]/div/button
    Execute JavaScript    document.querySelector("button.btn.btn-orange.px-5.float-end").click()
    ${class}    Get Element Attribute    xpath=//*[@id="nik"]    class
    Should Contain  ${class}  form-control

TC63-> Respondent memperbarui profil dengan mengisi pekerjaan menggunakan angka
    Go To    https://alpha.surveyasia.id/profile
    Click Element    css=.fa-edit
    Input Text    ${NIK}    1234567891234567
    Input Text    ${nl}    exRespondent
    Click Element    ${perempuan}
    Input Text    ${tempat_lahir}    Tegal
    Input Text    ${tgl_lahir}    10/04/2000
    Input Text    ${job}    12345678
    Input Text    ${provinsi}    DKI Jakarta
    Input Text    ${kota}    jakarta selatan
    Input Text    ${kec}    mampang prapatan
    Input Text    ${alamat}    jalan poncol jaya
    Input Text    ${kode_pos}    12710
    Element Should Be Enabled    xpath=/html/body/section/div[2]/form/div[4]/div/button
    Execute JavaScript    document.querySelector("button.btn.btn-orange.px-5.float-end").click()
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    Pekerjaan hanya boleh berisi huruf.

TC64-> Respondent memperbarui profil dengan mengisi provinsi menggunakan angka
    Go To    https://alpha.surveyasia.id/profile
    Click Element    css=.fa-edit
    Input Text    ${NIK}    1234567891234567
    Input Text    ${nl}    exRespondent
    Click Element    ${perempuan}
    Input Text    ${tempat_lahir}    Tegal
    Input Text    ${tgl_lahir}    10/04/2000
    Input Text    ${job}    mahasiswa
    Input Text    ${provinsi}    12345678
    Input Text    ${kota}    jakarta selatan
    Input Text    ${kec}    mampang prapatan
    Input Text    ${alamat}    jalan poncol jaya
    Input Text    ${kode_pos}    12710
    Element Should Be Enabled    xpath=/html/body/section/div[2]/form/div[4]/div/button
    Execute JavaScript    document.querySelector("button.btn.btn-orange.px-5.float-end").click()
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    Provinsi hanya boleh berisi huruf.

TC65-> Respondent memperbarui profil dengan mengisi kecamatan menggunakan angka
    Go To    https://alpha.surveyasia.id/profile
    Click Element    css=.fa-edit
    Input Text    ${NIK}    1234567891234567
    Input Text    ${nl}    exRespondent
    Click Element    ${perempuan}
    Input Text    ${tempat_lahir}    Tegal
    Input Text    ${tgl_lahir}    10/04/2000
    Input Text    ${job}    mahasiswa
    Input Text    ${provinsi}    DKI Jakarta
    Input Text    ${kota}    jakarta selatan
    Input Text    ${kec}    12345678
    Input Text    ${alamat}    jalan poncol jaya
    Input Text    ${kode_pos}    12710
    Element Should Be Enabled    xpath=/html/body/section/div[2]/form/div[4]/div/button
    Execute JavaScript    document.querySelector("button.btn.btn-orange.px-5.float-end").click()
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    Kecamatan hanya boleh berisi huruf.

TC66-> Respondent memperbarui profil dengan mengisi kode pos menggunakan huruf
    Go To    https://alpha.surveyasia.id/profile
    Click Element    css=.fa-edit
    Input Text    ${NIK}    1234567891234567
    Input Text    ${nl}    exRespondent
    Click Element    ${perempuan}
    Input Text    ${tempat_lahir}    Tegal
    Input Text    ${tgl_lahir}    10/04/2000
    Input Text    ${job}    mahasiswa
    Input Text    ${provinsi}    DKI Jakarta
    Input Text    ${kota}    jakarta selatan
    Input Text    ${kec}    mampang prapatan
    Input Text    ${alamat}    jalan poncol jaya
    Input Text    ${kode_pos}    Respondent
    Element Should Be Enabled    xpath=/html/body/section/div[2]/form/div[4]/div/button
    Execute JavaScript    document.querySelector("button.btn.btn-orange.px-5.float-end").click()
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    Kode Pos hanya boleh berisi angka.

TC67-> Respondent memperbarui profil dengan mengisi NIK kurang dari 16 digit
    Go To    https://alpha.surveyasia.id/profile
    Click Element    css=.fa-edit
    Input Text    ${NIK}    123
    Input Text    ${nl}    exRespondent
    Click Element    ${perempuan}
    Input Text    ${tempat_lahir}    Tegal
    Input Text    ${tgl_lahir}    10/04/2000
    Input Text    ${job}    mahasiswa
    Input Text    ${provinsi}    DKI Jakarta
    Input Text    ${kota}    jakarta selatan
    Input Text    ${kec}    mampang prapatan
    Input Text    ${alamat}    jalan poncol jaya
    Input Text    ${kode_pos}    12710
    Element Should Be Enabled    xpath=/html/body/section/div[2]/form/div[4]/div/button
    Execute JavaScript    document.querySelector("button.btn.btn-orange.px-5.float-end").click()
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    NIK harus berisi 16 angka.

TC68-> Respondent memperbarui profil dengan mengisi kabupaten/kota menggunakan angka
    Go To    https://alpha.surveyasia.id/profile
    Click Element    css=.fa-edit
    Input Text    ${NIK}    123456789
    Input Text    ${nl}    12345678
    Click Element    ${perempuan}
    Input Text    ${tempat_lahir}    Tegal
    Input Text    ${tgl_lahir}    10/04/2000
    Input Text    ${job}    mahasiswa
    Input Text    ${provinsi}    DKI Jakarta
    Input Text    ${kota}    jakarta selatan
    Input Text    ${kec}    mampang prapatan
    Input Text    ${alamat}    jalan poncol jaya
    Input Text    ${kode_pos}    12710
    Element Should Be Enabled    xpath=/html/body/section/div[2]/form/div[4]/div/button
    Execute JavaScript    document.querySelector("button.btn.btn-orange.px-5.float-end").click()
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    Kabupaten/Kota hanya boleh berisi huruf.

TC69-> Respondent memperbarui profil dengan mengisi tempat lahir menggunakan angka
    Go To    https://alpha.surveyasia.id/profile
    Click Element    css=.fa-edit
    Input Text    ${NIK}    1234567891234567
    Input Text    ${nl}    exRespondent
    Click Element    ${perempuan}
    Input Text    ${tempat_lahir}    12345678
    Input Text    ${tgl_lahir}    10/04/2000
    Input Text    ${job}    mahasiswa
    Input Text    ${provinsi}    DKI Jakarta
    Input Text    ${kota}    jakarta selatan
    Input Text    ${kec}    mampang prapatan
    Input Text    ${alamat}    jalan poncol jaya
    Input Text    ${kode_pos}    12710
    Element Should Be Enabled    xpath=/html/body/section/div[2]/form/div[4]/div/button
    Execute JavaScript    document.querySelector("button.btn.btn-orange.px-5.float-end").click()
    ${error_message}    Get Text    css=.invalid-feedback
    Should Be Equal As Strings    ${error_message}    Tempat lahir hanya boleh berisi huruf.

TC70-> Respondent memperbarui profil dengan mengisi tanggal lahir yang tidak valid
    Go To    https://alpha.surveyasia.id/profile
    Click Element    css=.fa-edit
    Input Text    ${NIK}    1234567891234567
    Input Text    ${nl}    exRespondent
    Click Element    ${perempuan}
    Input Text    ${tempat_lahir}    Tegal
    Input Text    ${tgl_lahir}    02/31/2023
    Input Text    ${job}    mahasiswa
    Input Text    ${provinsi}    DKI Jakarta
    Input Text    ${kota}    jakarta selatan
    Input Text    ${kec}    mampang prapatan
    Input Text    ${alamat}    jalan poncol jaya
    Input Text    ${kode_pos}    12710
    Element Should Be Enabled    xpath=/html/body/section/div[2]/form/div[4]/div/button
    Execute JavaScript    document.querySelector("button.btn.btn-orange.px-5.float-end").click()
    ${class}    Get Element Attribute    xpath=//*[@id="birth_date"]    class
    Should Contain  ${class}  form-control

TC71-> Respondent membatalkan perbaharuan profil
    Masuk Respondent
    Go To    https://alpha.surveyasia.id/profile
    Click Element    css=.fa-edit
    Input Text    ${NIK}    1234567891234567
    Input Text    ${nl}    exRespondent
    Click Element    ${perempuan}
    Input Text    ${tempat_lahir}    Tegal
    Input Text    ${tgl_lahir}    10/04/2000
    Input Text    ${job}    mahasiswa
    Input Text    ${provinsi}    DKI Jakarta
    Input Text    ${kota}    jakarta selatan
    Input Text    ${kec}    mampang prapatan
    Input Text    ${alamat}    jalan poncol jaya
    Input Text    ${kode_pos}    12710
    Element Should Be Enabled    xpath=/html/body/section/div[2]/form/div[4]/div/button
    Execute JavaScript    document.querySelector("a.btn.btn-outline-orange.px-5.float-end").click()
    Wait Until Page Contains    exRespondent