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


*** Test Cases ***

Log To Console Test
  Log to console   Dzien dobry
  Log to console   ${POWITANIE}

Math Test
  ${result}=   Evaluate   ${var_1} + ${var_2}
  Should be Equal   ${result}   ${25}

Lacz Stringi Test
  ${WYNIK}=   lacz_stringi   Czas   na nauke.
  Should Be Equal   ${WYNIK}   Czas na nauke.

Wypisz Na Ekran Test
  Wypisz Na Ekran   Bum tralala chlapie fala.

Wyswietl Strone Space-X Test
  ${TEST_STRONY}=   Get   ${SPACE_X_ADDRESS}   expected_status=200
  log   ${TEST_STRONY.json()}   formatter=repr
  ${NAME}=   get from dictionary  ${TEST_STRONY.json()}  name
  Log to console   Sprawdzam czy jest tekst: ${NAME}
  Should Be Equal   ${NAME}   Crew-5

Wersja Systemu Test
  Logowanie lokalne
  Wywolanie komendy i sprawdzenie wyniku
  Wylogowanie

Polacz Z Internetem Test
  [Documentation]   Testing internet connection
  ...               pinging 8.8.8.8

  Logowanie lokalne
  Sprawdzenie polaczenia internetowego
  Wylogowanie

Zalogoj Na WP Test
  Otwarcie przegladarki
  Zalogowanie na strone WP
  Sprawdzenie zalogowania
  Wylogowanie sie ze strony WP


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
