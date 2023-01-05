*** Settings ***

resource   resources/resources.robot
library   lacz_stringi.py

*** Variables ***
*** Test Cases ***

Log To Console And For Loops Test
  [Tags]     linux   keywords
  Log to console   Dzien dobry

  FOR   ${i}   IN RANGE   10
    Log to console   ${POWITANIE}
  END

  FOR   ${name}   IN   ksieciuniu   o najwspanialszy   o najdoskonalszy   o najszlachetniejszy
    Log to console   Dzien dobry ${name}.
  END

Math Test
  [Tags]     linux   math
  ${result}=   Evaluate   ${var_1} + ${var_2}
  Should be Equal   ${result}   ${25}

Lacz Stringi Test
  [Tags]     linux   python
  ${WYNIK}=   lacz_stringi   Czas   na nauke.
  Should Be Equal   ${WYNIK}   Czas na nauke.

Wypisz Na Ekran Test
  [Tags]     linux   keywords
  Wypisz Na Ekran   Bum tralala chlapie fala.

Wyswietl Strone Space-X Test
  [Tags]     linux   ssh
  ${TEST_STRONY}=   Get   ${SPACE_X_ADDRESS}   expected_status=200
  log   ${TEST_STRONY.json()}   formatter=repr
  ${NAME}=   get from dictionary  ${TEST_STRONY.json()}  name
  Log to console   Sprawdzam czy jest tekst: ${NAME}
  Should Be Equal   ${NAME}   Crew-5

Wersja Systemu Test
  [Tags]     linux   keywords   ssh
  ${password_len}=   Get Length   ${PASSWORD}
  IF   len('${PASSWORD}') < 4
    Log to console   It works !!!!
  END

  IF   ${password_len} < 4
     Skip   Fill username and password variables first.
  END
  Logowanie lokalne
  Wywolanie komendy i sprawdzenie wyniku
  Wylogowanie

Polacz Z Internetem Test
  [Documentation]   Testing internet connection
  ...               pinging 8.8.8.8
  [Tags]     ssh
  Skip   Fill username and password variables first..
  Logowanie lokalne
  Sprawdzenie polaczenia internetowego
  Wylogowanie

Zalogoj Na WP Test
  [Tags]     selenium   keywords
  Skip   Fill username and password variables first...
  #Fail   Fill username and password variables first...
  Otwarcie przegladarki
  Zalogowanie na strone WP
  Sprawdzenie zalogowania
  Wylogowanie sie ze strony WP
