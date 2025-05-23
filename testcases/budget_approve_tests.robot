*** Settings ***
Documentation    Test cases for Budget Approve
Resource    ../resources/config.robot
Resource    ../resources/testdata.robot
Resource    ../keywords/login_keywords.robot
Resource    ../testcases/budget_request_tests.robot
Library     SeleniumLibrary
Suite Setup       Open Browser To Application
Suite Teardown    Close Browser

Test Setup    ล็อคอินถูกต้อง
*** Test Cases ***

TC003 : ส่วนราชการยืนยันข้อมูลรายจ่ายประจำ
    [Documentation]    รัน TC003 โดย login บัญชี orgprov
    [Tags]    ส่วนราชการบันทึกแบบคำขอ
    [Setup]    ล็อคอินถูกต้อง   ${ORGPROV_USERNAME}    ${ORGPROV_PASSWORD}
    กรอกข้อมูลแบบคำขอตามประเภทและการบันทึก    รายจ่ายประจำ    confirm

TC004 : ส่วนราชการยืนยันข้อมูลรายจ่ายลงทุน
    [Documentation]    รัน TC004 โดย login บัญชี orgprov
    [Tags]    ส่วนราชการบันทึกแบบคำขอ
    [Setup]    ล็อคอินถูกต้อง    ${ORGPROV_USERNAME}    ${ORGPROV_PASSWORD}
    กรอกข้อมูลแบบคำขอตามประเภทและการบันทึก    รายจ่ายลงทุน    confirm

TC005 : เจ้าหน้าที่จังหวัดยืนยันข้อมูล
    [Documentation]    เจ้าหน้าที่จังหวัดยืนยันข้อมูล
    [Tags]    จังหวัดพิจารณาคำขอ
    [Setup]    ล็อคอินถูกต้อง    ${PRO_USERNAME}    ${PRO_PASSWORD}
    จังหวัดเข้าเมนูแบบคำขอ
    เลือกช่องทั้งหมด
    กดปุ่มจังหวัดยืนยัน

TC006 : เจ้าหน้าที่จังหวัดส่งกลับแก้ไข
    [Documentation]    เจ้าหน้าที่จังหวัดส่งกลับแก้ไข
    [Tags]    จังหวัดพิจารณาคำขอ
    [Setup]    ล็อคอินถูกต้อง    ${PRO_USERNAME}    ${PRO_PASSWORD}
    จังหวัดเข้าเมนูแบบคำขอ
    เลือกช่องทั้งหมด
    กดปุ่มส่งกลับแก้ไข





