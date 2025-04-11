*** Settings ***
Documentation    Test cases for Budget Request Functionality
Resource    ../resources/config.robot
Resource    ../resources/testdata.robot
Resource    ../keywords/login_keywords.robot
Resource    ../keywords/budget_keywords.robot
Resource    ../keywords/budget_keywords_tab2.robot
Resource    ../keywords/budget_keywords_tab3.robot
Resource    ../keywords/budget_keywords_tab4.robot
Resource    ../keywords/budget_keywords_tab5.robot
Library     SeleniumLibrary

*** Test Cases ***
Add New Budget Request
    [Documentation]    เพิ่มข้อมูลแบบคำขอ
    Open Login Page
    Input Credentials    ${ORGPROV_USERNAME}    ${ORGPROV_PASSWORD}
    Verify Login Successful
    Go To Budget Request Page
   # ทำซ้ำ 3 รอบเพื่อเพิ่มข้อมูล
    #FOR    ${index}    IN RANGE    3
        #Log To Console    *** Running iteration: ${index+1} ***
    Click Add Budget Request
        Fill Budget Request Form Part1
        Fill Budget Request Form Part2
        Fill Budget Request Form Part3
        Fill Budget Request Form Part4
        Click Next Button Tab1
        Fill Tab2 Part1
        Fill Tab2 Part2
        Fill Tab2 Part3
        Fill Tab2 Part4
        Click Next Button Tab2
        FOR    ${index}    IN RANGE    3
        Fill Tab3
        Add SubActivity
        # เติมข้อมูลหลายประเภทงบประมาณ
            FOR    ${index}    IN RANGE    5
              ${budgetType}    ${paymentGruop}    ${paymentType}    ${amount}    Get Budget Info    ${index}
              Select Budget and Payment Type    ${budgetType}    ${paymentGruop}    ${paymentType}    ${index}
              Add Budget Item
              Fill Amount and Explanation    ${index}    ${amount}
            END
        Save SubActivity
        Save Procedure
        END
        Click Next Button Tab3
        Fill Tab4 Part1
        Fill Tab4 Part2
        Fill Tab4 Part3
        Click Next Button Tab4
        Fill Tab5
    Click Submit Button
    #END
    Close Browser  
