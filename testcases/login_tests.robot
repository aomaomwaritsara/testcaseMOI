*** Settings ***
Documentation    Test cases for Login Functionality
Resource    ../resources/config.robot
Resource    ../resources/testdata.robot
Resource    ../keywords/login_keywords.robot
Library     SeleniumLibrary

*** Test Cases ***
Login With Valid Credentials
    [Documentation]    Verify user can log in with valid credentials
    Open Login Page
    Input Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Login Successful
    Close Browser Session

Login With Invalid Credentials
    [Documentation]    Verify user cannot log in with invalid credentials
    Open Login Page
    Input Credentials    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Verify Login Failed
    Close Browser Session
