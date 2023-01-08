*** Settings ***
library   DataDriver   file=resources/str.csv   dialect=excel
             #bez dialect=excel wyrzucal blad: "Variable '${string_1}' not found."
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
Test Laczenia Stringow: ${string_1} + ${string_2}
