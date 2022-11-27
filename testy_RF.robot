*** Settings ***
library   lacz_stringi.py
library   RequestsLibrary
library   Collections
library   SSHLibrary

*** Variables ***
${POWITANIE}   Dzien dobry jasnie oswiecony uzytkowniku.
${SPACE_X_ADDRESS}   https://api.spacexdata.com/v4/launches/latest

${USER}   ___
${PASSWORD}   ___
${HOST}   localhost

*** Test Cases ***
My Test
  Log to console   Dzien dobry

My Second Test
   Log to console   ${POWITANIE}
   Log to console   ${SPACE_X_ADDRESS}

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
  Logowanie lokalne
  ${ODPOWIEDZ}=   execute command   ping -c1 8.8.8.8
  Log to console    ${ODPOWIEDZ}
  should contain   ${ODPOWIEDZ}   0% packet loss
  Wylogowanie

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
