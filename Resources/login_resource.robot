*** Settings ***
Library        SeleniumLibrary
Library        Collections
Library        OperatingSystem


*** Variables ***
${LOGIN_PAGE_URL}       https://www.saucedemo.com/
#${USERNAME}             standard_user
#${PASSWORD}             secret_sauce
${BROWSER}              chrome

*** Keywords ***
user on login page
    open browser   ${LOGIN_PAGE_URL}  ${BROWSER}
    Maximize browser window
enters valid username
    [Arguments]    ${USERNAME}
    input text  id=user-name  ${USERNAME}
enters valid password
    [Arguments]    ${PASSWORD}
    input text  id=password  ${PASSWORD}
clicks on submit button
    click button  id:login-button
Closing Browser
    Close all browsers