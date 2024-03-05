*** Settings ***
Library        SeleniumLibrary
Library        Collections
Library        OperatingSystem


*** Variables ***
${LOGIN_PAGE_URL}       https://sampleapp.tricentis.com/101/#
${BROWSER}              chrome


*** Test Cases ***
NavigateToInsuranceClaimTest
    Given user on SampleApp Page
    Then user clicks on Get a quote link
    And user is navigated to MotorCycleInsurance page

*** Keywords ***
user on SampleApp Page
    open browser   ${LOGIN_PAGE_URL}  ${BROWSER}
    Maximize browser window
    Sleep    15s
user clicks on Get a quote link
    seleniumlibrary.click element    xpath=//*[@id="get_truck"]
user is navigated to MotorCycleInsurance page
    Element Should Contain    xpath=//*[@id='selectedinsurance']    Truck Insurance