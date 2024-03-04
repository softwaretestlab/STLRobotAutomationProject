*** Settings ***
Library             SeleniumLibrary
Library             Collections
Library             OperatingSystem
Resource            ../Resources/login_resource.robot
Suite Setup         user on login page
Suite Teardown      Closing Browser
Test Template       Login To Website

*** Variables ***
#${LOGIN_PAGE_URL}       https://www.saucedemo.com/
${USERNAME}             standard_user
${PASSWORD}             secret_sauce
#${BROWSER}              chrome

*** Test Cases ***                USERNAME         PASSWORD
Invalid User Name                 invalid          ${PASSWORD}
Invalid Password                  ${USERNAME}      invalid
Invalid User Name and Password    invalid          invalid
Empty User Name                   ${EMPTY}         ${PASSWORD}
Empty User Name and Password      ${EMPTY}         ${EMPTY}
Empty Password                    ${USERNAME}      ${EMPTY}


*** Keywords ***
Login To Website
    [Arguments]    ${username}    ${password}
    Log Many    ${username}    ${password}
    enters valid username    ${username}
    enters valid password    ${password}
    Sleep    3s
    clicks on submit button