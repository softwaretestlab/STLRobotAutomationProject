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
${INVALID}              invalid

*** Test Cases ***
Scenario: userloginTest
    [Template]    Login To Website
        #username       #password
        ${INVALID}      ${PASSWORD}
        ${USERNAME}     ${INVALID}
        ${INVALID}      ${INVALID}
        ${EMPTY}        ${PASSWORD}
        ${EMPTY}        ${EMPTY}
        ${USERNAME}     ${EMPTY}


*** Keywords ***
Login To Website
    [Arguments]    ${username}    ${password}
    Log Many    ${username}    ${password}
    enters valid username    ${username}
    enters valid password    ${password}
    Sleep    2s
    clicks on submit button