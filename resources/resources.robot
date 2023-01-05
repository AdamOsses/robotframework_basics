*** Settings ***

library   lacz_stringi.py
library   RequestsLibrary
library   Collections
library   SSHLibrary
library   SeleniumLibrary


*** Variables ***

${POWITANIE}   Dzien dobry jasnie oswiecony uzytkowniku.
${SPACE_X_ADDRESS}   https://api.spacexdata.com/v4/launches/latest

${var_1}=   ${10}  # int
${var_2}=   ${15}

${USER}  ___
${PASSWORD}   ___
${HOST}   localhost

${UZYTKOWNIK}   ___
${HASLO_TEKST}  ___
${BROWSER}   Firefox
${WP_URL}   https://profil.wp.pl/login/login.html
${LOGIN}  //*[@id="login"]
${HASLO}  //*[@id="password"]
${RODO}   //button[contains(text(),'PRZECHODZ')]
${PRZYCISK_ZALOGOJ}   //button[@type="submit"]


*** Keywords ***

Wypisz Na Ekran
  [Arguments]   ${WYPISZ}
  Log to console   ${WYPISZ}

Logowanie lokalne
  Open connection   ${HOST}
  Login    ${USER}   ${PASSWORD}

Wywolanie komendy i sprawdzenie wyniku
  ${WYNIK}=   execute command   uname -a
  should contain    ${WYNIK}   GNU/Linux

Wylogowanie
  close all connections

Sprawdzenie polaczenia internetowego
  ${ODPOWIEDZ}=   execute command   ping -c1 8.8.8.8
  Log to console    ${ODPOWIEDZ}
  should contain   ${ODPOWIEDZ}   , 0% packet loss

Otwarcie przegladarki
  OpenBrowser   about:blank   ${BROWSER}
  Go to   ${WP_URL}
  Sleep   10

Zalogowanie na strone WP
  Click element   ${RODO}
  Sleep   10
  Input text   ${LOGIN}   ${UZYTKOWNIK}
  Input text   ${HASLO}   ${HASLO_TEKST}
  Click button   ${PRZYCISK_ZALOGOJ}
  Sleep   5

Sprawdzenie zalogowania
    Page should contain   Odebrane

Wylogowanie sie ze strony WP
  Close all browsers
