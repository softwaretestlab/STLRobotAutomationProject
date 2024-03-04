*** Settings ***
//run_on_failure=Nothing --> this command stops selenium from taking screeshot when test fails
Library        SeleniumLibrary    run_on_failure=Nothing
Library        Collections
Library        OperatingSystem

*** Variables ***
${LOGIN_PAGE_URL}       https://www.saucedemo.com/
${USERNAME}             standard_user
${PASSWORD}             secret_sauces
${BROWSER}              chrome
${expected_text}        Products
*** Test Cases ***
AT02_CaptureTextNassert
    [Documentation]    This test case is to test login with BDD syntax
    Given user on login page
    Then enters valid username
    Then enters valid password
    Then clicks on submit button
    Then Verify to be on Product Page

*** Keywords ***
user on login page
    open browser   ${LOGIN_PAGE_URL}  ${BROWSER}
enters valid username
    input text  id:user-name  ${USERNAME}
enters valid password
    input text  id:password  ${PASSWORD}
clicks on submit button
    click button  id:login-button
Verify to be on Product Page
    ${Actual_text}    Get Text    xpath=//*[contains(text(),'Products')]
    Log    Captured Text: ${Actual_text}
#    ${expected_text}    Set Variable    Products
#    Exact Match Assertion:
    Should Be Equal As Strings    ${Actual_text}    ${expected_text}
#    Partial Match Assertion:
    Should Contain    ${Actual_text}    ${expected_text}


