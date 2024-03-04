*** Settings ***
Library         SeleniumLibrary
Library        Collections
Library        OperatingSystem

*** Variables ***
${LOGIN_PAGE_URL}       https://www.saucedemo.com/
${USERNAME}             standard_user
${PASSWORD}             secret_sauce
${BROWSER}              chrome

*** Test Cases ***
AT02_VerifyAddAllProductsNDelete
    [Documentation]    This test case is to test login with BDD syntax
    Given user on login page
    Then Add All Items To Cart
    And Navigate To Cart Page
    Then Remove All Items And Verify Removal
    Then Verify that the cart is empty
    Then Close Browser


*** Keywords ***
user on login page
    Open Browser    ${LOGIN_PAGE_URL}    chrome
    Input Text      id:user-name         ${USERNAME}
    Input Text      id:password          ${PASSWORD}
    Click Button    id:login-button
    Maximize browser window

Add All Items To Cart
    ${add_To_Cart_buttons}    Get WebElements    xpath=//button[contains(text(),'Add to cart')]
    ${buttons_count}    Get length  ${add_To_Cart_buttons}
    Log   ${buttons_count}
    FOR    ${i}    IN RANGE    ${buttons_count}
       Click element    ${add_To_Cart_buttons}[${i}]
       Sleep    1s
    END

Navigate To Cart Page
    Click Element    xpath=//span[@class='shopping_cart_badge']

Remove All Items And Verify Removal
    ${remove_buttons}    Get WebElements    xpath=//*[@class='btn btn_secondary btn_small cart_button']
    FOR    ${button}    IN    @{remove_buttons}
        Click Element    ${button}
    END

Verify that the cart is empty
    Element Should Not Be Visible    xpath://*[contains(text(),'Remove')]