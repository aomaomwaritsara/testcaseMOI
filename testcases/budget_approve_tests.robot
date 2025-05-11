*** Settings ***
Documentation    Test cases for Budget Approve
Resource    ../resources/config.robot
Resource    ../resources/testdata.robot
Resource    ../keywords/login_keywords.robot
Resource    ../keywords/budget_provapp_keywords.robot
Library     SeleniumLibrary

*** Test Cases ***
Province Approve
    [Documentation]    จังหวัดยืนยันข้อมูล
    Open Login Page
    Input Credentials    ${PRO_USERNAME}    ${PRO_PASSWORD}
    Verify Login Successful
    Go To Budget Request Page
    Select All Checkboxes
    Click Confirm Button
    Close Browser  
