*** Settings ***
Suite Setup     Send Suite Setup Message
Test Setup     Send Test Setup Message
Suite Teardown     Send Suite Teardown Message
Test Teardown     Send Test Teardown Message

# Add resource    any_robot_file.robot
*** Variables ***


*** Keywords ***
Send Suite Setup Message
  Log to console   Running suite setup...

Send Test Setup Message
  Log to console   Running test setup...

Send Suite Teardown Message
  Log to console   Running suite teardown...

Send Test Teardown Message
  Log to console   Running test teardown...

*** Test Cases ***
Test nr 1
  Log to console   Its -1- test.

Test nr 2
  Log to console   Its -2- test.
