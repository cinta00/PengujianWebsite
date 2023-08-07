*** Settings ***
Library     SeleniumLibrary
Resource    resources/daftar_researcher.robot
Resource    resources/daftar_respondent.robot
Resource    resources/masuk.robot
Resource    resources/profil_researcher.robot
Resource    resources/survey.robot
Resource    resources/profil_respondent.robot

*** Test Cases ***
#-------------------------------MASUK--------------------------------------
#--------------------------------------------------------------------------
Masuk
    Run Keyword And Continue On Failure    TC02-> Masuk dengan email yang belum terdaftar
    Run Keyword And Continue On Failure    TC03-> Masuk dengan email tidak sesuai format
    Run Keyword And Continue On Failure    TC04-> Masuk dengan password tidak tepat
    Run Keyword And Continue On Failure    TC05-> Masuk dengan tidak mengisi email dan password
    Run Keyword And Continue On Failure    TC01-> Masuk dengan data valid
    Run Keyword And Continue On Failure    TC06-> Researcher keluar dari akun
    Run Keyword And Continue On Failure    TC07-> Respondent keluar dari akun
    Close All Browsers
    
#-------------------------------DAFTAR--------------------------------------
#-----------------------------RESEARCHER------------------------------------

Daftar Researcher
    Run Keyword And Continue On Failure    TC17-> Researcher daftar dengan nomor telepon menggunakan huruf
    Run Keyword And Continue On Failure    TC09-> Researcher daftar dengan nama lengkap tidak diisi
    Run Keyword And Continue On Failure    TC10-> Researcher daftar dengan email tidak diisi
    Run Keyword And Continue On Failure    TC11-> Researcher daftar dengan nomor telepon tidak diisi
    Run Keyword And Continue On Failure    TC12-> Researcher daftar dengan password tidak diisi
    Run Keyword And Continue On Failure    TC13-> Researcher daftar dengan confirm password tidak diisi
    Run Keyword And Continue On Failure    TC15-> Researcher daftar dengan email tidak sesuai format
    Run Keyword And Continue On Failure    TC22-> Researcher daftar dengan tidak mencentang box syarat dan ketentuan
    Run Keyword And Continue On Failure    TC14-> Researcher daftar dengan nama lengkap menggunakan huruf dan angka
    Run Keyword And Continue On Failure    TC16-> Researcher daftar dengan nomor telepon kurang dari 11 karakter
    Run Keyword And Continue On Failure    TC18-> Researcher daftar dengan password kurang dari 8 karakter
    Run Keyword And Continue On Failure    TC19-> Researcher daftar dengan password tanpa menggunakan huruf besar,angka, dan karakter khusus
    Run Keyword And Continue On Failure    TC20-> Researcher daftar dengan konfirmasi password tidak sama dengan password
    Run Keyword And Continue On Failure    TC21-> Researcher daftar dengan email yang sudah terdaftar
    Run Keyword And Continue On Failure    TC08-> Researcher daftar dengan data valid
    Close All Browsers

#-------------------------------PROFIL--------------------------------------
#-----------------------------RESEARCHER------------------------------------
Profil Researcher
    Run Keyword And Continue On Failure    TC35-> Researcher membatalkan perbaharuan profil
    Run Keyword And Continue On Failure    TC26-> Researcher memperbarui profil dengan mengisi pekerjaan menggunakan angka
    Run Keyword And Continue On Failure    TC27-> Researcher memperbarui profil dengan mengisi provinsi menggunakan angka
    Run Keyword And Continue On Failure    TC28-> Researcher memperbarui profil dengan mengisi kecamatan menggunakan angka
    Run Keyword And Continue On Failure    TC29-> Researcher memperbarui profil dengan mengisi kode pos menggunakan huruf
    Run Keyword And Continue On Failure    TC30-> Researcher memperbarui profil dengan mengisi NIK kurang dari 16 digit
    Run Keyword And Continue On Failure    TC31-> Researcher memperbarui profil dengan mengisi NIK menggunakan huruf
    Run Keyword And Continue On Failure    TC32-> Researcher memperbarui profil dengan mengisi kabupaten/kota menggunakan angka
    Run Keyword And Continue On Failure    TC33-> Researcher memperbarui profil dengan mengisi tempat lahir menggunakan angka
    Run Keyword And Continue On Failure    TC34-> Researcher memperbarui profil dengan mengisi tanggal lahir yang tidak valid
    Run Keyword And Continue On Failure    TC23-> Researcher memperbarui profil
    Run Keyword And Continue On Failure    TC24-> Researcher memperbarui profil dengan mengisi nama lengkap menggunakan angka
    Run Keyword And Continue On Failure    TC25-> Researcher memperbarui profil dengan tidak mengisi NIK
    Close All Browsers

#-------------------------------BUAT---------------------------------------
#------------------------------SURVEY--------------------------------------

Survey
    Run Keyword And Continue On Failure    TC37-> Researcher mencari survey dengan data tidak valid
    Run Keyword And Continue On Failure    TC36-> Researcher mencari survey dengan data valid
    Run Keyword And Continue On Failure    TC38-> Researcher menghapus survey
    Run Keyword And Continue On Failure    TC41-> Researcher membagikan survey
    Run Keyword And Continue On Failure    TC42-> Researcher mengganti nama link survey
    Run Keyword And Continue On Failure    TC43-> Researcher dapat melihat hasil analisis survey
    Run Keyword And Continue On Failure    TC40-> Researcher mengirim pesan kepada SurveyAsia dengan data tidak valid
    Run Keyword And Continue On Failure    TC39-> Researcher mengirim pesan kepada SurveyAsia dengan data valid
    Close All Browsers
    
#-------------------------------DAFTAR--------------------------------------
#-----------------------------RESPONDEN-------------------------------------

Daftar Respondent
    Run Keyword And Continue On Failure    TC54-> Respondent daftar dengan nomor telepon menggunakan huruf
    Run Keyword And Continue On Failure    TC45-> Respondent daftar dengan nama lengkap tidak diisi
    Run Keyword And Continue On Failure    TC46-> Respondent daftar dengan email tidak diisi
    Run Keyword And Continue On Failure    TC47-> Respondent daftar dengan nomor telepon tidak diisi
    Run Keyword And Continue On Failure    TC48-> Respondent daftar dengan password tidak diisi
    Run Keyword And Continue On Failure    TC49-> Respondent daftar dengan confirm password tidak diisi
    Run Keyword And Continue On Failure    TC52-> Respondent daftar dengan email tidak sesuai format
    Run Keyword And Continue On Failure    TC59-> Respondent daftar dengan tidak mencentang box syarat dan ketentuan
    Run Keyword And Continue On Failure    TC50-> Respondent daftar dengan nama lengkap menggunakan huruf dan angka
    Run Keyword And Continue On Failure    TC51-> Respondent daftar dengan nama lengkap menggunakan angka
    Run Keyword And Continue On Failure    TC52-> Respondent daftar dengan email tidak sesuai format
    Run Keyword And Continue On Failure    TC53-> Respondent daftar dengan nomor telepon kurang dari 11 karakter
    Run Keyword And Continue On Failure    TC55-> Respondent daftar dengan password kurang dari 8 karakter
    Run Keyword And Continue On Failure    TC56-> Respondent daftar dengan password tanpa menggunakan huruf besar,angka, dan karakter khusus
    Run Keyword And Continue On Failure    TC57-> Respondent daftar dengan konfirmasi password tidak sama dengan password
    Run Keyword And Continue On Failure    TC58-> Respondent daftar dengan email yang sudah terdaftar
    Run Keyword And Continue On Failure    TC44-> Respondent daftar dengan data valid
    Close All Browsers

Profil Respondent
    Run Keyword And Continue On Failure    TC71-> Respondent membatalkan perbaharuan profil
    Run Keyword And Continue On Failure    TC63-> Respondent memperbarui profil dengan mengisi pekerjaan menggunakan angka
    Run Keyword And Continue On Failure    TC64-> Respondent memperbarui profil dengan mengisi provinsi menggunakan angka
    Run Keyword And Continue On Failure    TC65-> Respondent memperbarui profil dengan mengisi kecamatan menggunakan angka
    Run Keyword And Continue On Failure    TC66-> Respondent memperbarui profil dengan mengisi kode pos menggunakan huruf
    Run Keyword And Continue On Failure    TC67-> Respondent memperbarui profil dengan mengisi NIK kurang dari 16 digit
    Run Keyword And Continue On Failure    TC68-> Respondent memperbarui profil dengan mengisi kabupaten/kota menggunakan angka
    Run Keyword And Continue On Failure    TC69-> Respondent memperbarui profil dengan mengisi tempat lahir menggunakan angka
    Run Keyword And Continue On Failure    TC70-> Respondent memperbarui profil dengan mengisi tanggal lahir yang tidak valid
    Run Keyword And Continue On Failure    TC60-> Respondent memperbarui profil
    Run Keyword And Continue On Failure    TC61-> Respondent memperbarui profil dengan mengisi nama lengkap menggunakan angka
    Run Keyword And Continue On Failure    TC62-> Respondent memperbarui profil dengan tidak mengisi NIK

Mengisi survey
    Run Keyword And Continue On Failure    TC72-> Respondent mengisi survey
    Run Keyword And Continue On Failure    TC73-> Respondent mengisi survey yang sama
    Run Keyword And Continue On Failure    TC74-> Pilih Kategori Survei Customers
    Run Keyword And Continue On Failure    TC75-> Pilih Kategori Survei Education
    Run Keyword And Continue On Failure    TC76-> Pilih Kategori Survei Healthcare
    Run Keyword And Continue On Failure    TC77-> Pilih Kategori Survei Employee
    Run Keyword And Continue On Failure    TC78-> Pilih Kategori Survei Market Research
    Run Keyword And Continue On Failure    TC79-> Cari survey valid
    Run Keyword And Continue On Failure    TC80-> Cari survey tidak valid
    Close All Browsers
