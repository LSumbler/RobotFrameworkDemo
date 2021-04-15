*** Settings ***

Resource    Keywords.robot

*** Test Cases ***

Add an Item to the Cart
    Given I am Logged in as     standard_user    secret_sauce
    When I add an Item to my cart
    Then The item appears in my cart
    [Teardown]    Close Browser