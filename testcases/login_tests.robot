*** Settings ***
Documentation    Test cases for Login Functionality
Resource    ../resources/config.robot
Resource    ../resources/testdata.robot
Resource    ../keywords/login_keywords.robot
Library     SeleniumLibrary

*** Test Cases ***
ล็อคอินถูกต้อง
    [Documentation]    Verify user can log in with valid credentials
    Open Browser To Application
    กรอกข้อมูลเข้าสู่ระบบ   ${VALID_USERNAME}    ${VALID_PASSWORD}
    ล็อคอินถูกต้อง
    Close Browser

ล็อคอินไม่ถูกต้อง
    [Documentation]    Verify user cannot log in with invalid credentials
    Open Browser To Application
    กรอกข้อมูลเข้าสู่ระบบ   ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    ล็อคอินไม่ถูกต้อง
    Close Browser 
