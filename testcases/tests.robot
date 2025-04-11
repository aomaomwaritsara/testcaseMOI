*** Settings ***
Documentation    Test cases for Budget Request Functionality
Resource    ../resources/config.robot
Resource    ../resources/testdata.robot
Resource    ../keywords/login_keywords.robot
Resource    ../keywords/test.robot
Library     SeleniumLibrary

*** Test Cases ***
Add New Budget Request
    [Documentation]    Verify user can add a new budget request successfully
    Open Login Page
    Input Credentials    ${ORGPROV_USERNAME}    ${ORGPROV_PASSWORD}
    Verify Login Successful
    Go To Budget Request Page
    Click Add Budget Request
    Fill Budget Request Form Part1
    Click Next Button Tab1
    Close Browser  
