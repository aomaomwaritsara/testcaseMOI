*** Settings ***
Documentation    Test cases for Budget Request Functionality
Resource    ../resources/config.robot
Resource    ../resources/testdata.robot
Resource    ../keywords/login_keywords.robot
Resource    ../keywords/Bg_step1_request_reason.robot
Resource    ../keywords/Bg_step2_general_info.robot
Resource    ../keywords/Bg_step3_operation_plan.robot
Resource    ../keywords/Bg_step4_project_readiness.robot
Resource    ../keywords/Bg_step5_project_status.robot
Library     SeleniumLibrary

*** Test Cases ***
Add New Budget Request
    [Documentation]    เพิ่มข้อมูลแบบคำขอ
    Open Login Page
    Input Credentials    ${ORGPROV_USERNAME1}    ${ORGPROV_PASSWORD1}
    Verify Login Successful
    Go To Budget Request Page
   # เพิ่มข้อมูลแบบคำขอ
    FOR    ${index}    IN RANGE    1
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
        #เพิ่มกิจกรรมย่อย
        FOR    ${index}    IN RANGE    1
        Fill Tab3
        Add SubActivity
        # เติมข้อมูลหลายประเภทงบประมาณ
            FOR    ${index}    IN RANGE    1
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
    END
    Close Browser  
