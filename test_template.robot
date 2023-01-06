*** Settings ***

resource   resources/resources.robot
library   resources/lacz_stringi.py

Test Template   Sprawdz Laczenie Stringow

*** Variables ***

*** Keywords ***
Sprawdz Laczenie Stringow
    [Arguments]   ${string_1}   ${string_2}

    ${poprwane_polaczenie}=   Set variable   ${string_1} ${string_2}
    ${testowane_polaczenie}=   lacz_stringi   ${string_1}    ${string_2}
    Log To Console   ${poprwane_polaczenie}
    Log To Console   ${testowane_polaczenie}
    Should Be Equal   ${poprwane_polaczenie}   ${testowane_polaczenie}


*** Test Cases ***
Test Laczenia Stringow 001   Wlazl kotek    na plotek.
Test Laczenia Stringow 002  Nosil wilk razy kilka.   Poniesli i wilka.
Test Laczenia Stringow 003  Idzie Grzes przez wies.   Worek piasku niesie.
