*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${LOGIN_PAGE_URL}        https://www.saucedemo.com/
${USERNAME}              standard_user
${PASSWORD}              secret_sauce
${FirstFilter}           Name (Z to A)

*** Test Cases ***
AT03_VerifyAToZfilter
    [Tags]  FunctionalTest
    Given user logs into SwagLabs
    Then user clicks on sort filter
    And Assert that all the items are orgainsed in Z To A order
#    Then Close Browser


*** Keywords ***
user logs into SwagLabs
    Open Browser    ${LOGIN_PAGE_URL}    chrome
    Maximize Browser Window
    Input Text      id:user-name         ${USERNAME}
    Input Text      id:password          ${PASSWORD}
    Click Button    id:login-button

user clicks on sort filter
    ${FilterList}    Get WebElements    xpath=//*[@class='product_sort_container']/option
    ${filter_size}   Get length   ${FilterList}
    Log    filter_size:${filter_size}
    Log    FirstElementNameIs:${FilterList[0].text}

    FOR    ${i}    IN RANGE    ${filter_size}
        ${filter_name}    Get text    ${FilterList}[${i}]
        Log    FilterName: ${filter_name}
        ${condition}    Evaluate    '${filter_name}' == '${FirstFilter}'
        Run Keyword If   ${condition}  Click Element  ${filter_list}[${i}]
        Sleep  1s
        Run Keyword If   ${condition}  Exit For Loop
    END

Assert that all the items are orgainsed in Z To A order
    ${default_sorted}    Get WebElements    xpath=//div[@class='inventory_item_name ']
    ${default_sorted_size}    Get Length    ${default_sorted}
    Log    Filter Size1: ${default_sorted_size}
    Log    First element text1: ${default_sorted[0].text}
    ${act_item_names}    Create List    Test.allTheThings() T-Shirt (Red)  Sauce Labs Onesie  Sauce Labs Fleece Jacket  Sauce Labs Bolt T-Shirt  Sauce Labs Bike Light  Sauce Labs Backpack
    FOR    ${j}    IN RANGE    ${default_sorted_size}
        ${exp_item_name}    Get Text    ${default_sorted}[${j}]
        Log    ExpItemName: ${exp_item_name}
        ${act_item_name}    Collections.Get From List    ${act_item_names}    ${j}
        Log    ItsValueIs: ${act_item_name}
        Should Be Equal As Strings    ${exp_item_name}    ${act_item_name}
        Sleep  1s
    END