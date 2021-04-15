*** Settings ***

Library  SeleniumLibrary
Variables   Page.yaml

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    Chrome

*** Keywords ***

I am logged in as
    [Arguments]     ${username}     ${password}
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible   ${loginPage.usernameInput}
    Input Text  ${loginPage.usernameInput}  ${username}
    Input Password  ${loginPage.passwordInput}  ${password}
    Click Button    ${loginPage.loginButton}

I add an Item to my cart
    Wait Until Element Is Visible   ${shopPage.addBackpackButton}
    Click Element   ${shopPage.addBackpackButton}

Open Cart
    Click Element    ${shopPage.shoppingCartLink}
    Wait Until Element Is Visible    ${cartPage.cartContents}

The item appears in my cart
    Open Cart
    Element Text Should Be    ${cartPage.firstCartContentItemName}    Sauce Labs Backpack