*** Settings ***
Library        SeleniumLibrary
Library        Collections
Library        OperatingSystem


*** Variables ***
${LOGIN_PAGE_URL}       https://www.saucedemo.com/
${USERNAME}             standard_user
${PASSWORD}             secret_sauce
${BROWSER}              chrome


*** Test Cases ***
ddtTest
    [Documentation]    This test case is to test login with BDD syntax
    Given user on login page
    Then enters valid username
    Then enters valid password
    Then clicks on submit button

*** Keywords ***
user on login page
    open browser   ${LOGIN_PAGE_URL}  ${BROWSER}
enters valid username
    input text  id:user-name  ${USERNAME}
enters valid password
    input text  id:password  ${PASSWORD}
clicks on submit button
    click button  id:login-button
