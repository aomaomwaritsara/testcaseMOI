*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
จังหวัดเข้าเมนูแบบคำขอ
    [Documentation]    เข้าเมนูเพิ่มข้อมูลแบบคำขอ
    Wait Until Element Is Visible   xpath=//span[contains(text(),'ระบบแพลตฟอร์มกลางข้อมูลกระทรวงมหาดไทย')]   timeout=10s
    Click Element     xpath=//span[contains(text(),'ระบบแพลตฟอร์มกลางข้อมูลกระทรวงมหาดไทย')]  
    Wait Until Element Is Visible    xpath=//a[contains(text(),'บันทึกคำของบประมาณโครงการ')]  timeout=10s
    Click Element     xpath=//a[contains(text(),'บันทึกคำของบประมาณโครงการ')] 
    Wait Until Element Is Visible    xpath=//a[contains(text(),'แบบคำของบประมาณ')]    timeout=10s
    Click Element    xpath=//a[contains(text(),'แบบคำของบประมาณ')]
    Wait Until Page Contains    แบบคำของบประมาณ    timeout=10s
เลือกช่องทั้งหมด
    [Documentation]    checkbox ทั้งหมดและเลือกข้อมูล
    Wait Until Element Is Visible    xpath= //input[@name='status_all']
    Click Element    xpath= //input[@name='status_all']
    Sleep    3s
กดปุ่มจังหวัดยืนยัน
    [Documentation]    จังหวัดกดปุ่มยืนยันข้อมูล
    Wait Until Element Is Visible    xpath=//button[contains(text(),'จังหวัดยืนยัน')]    timeout=10s
    Click Button    xpath=//button[contains(text(),'จังหวัดยืนยัน')]
    Click Element    xpath=//button[@class='swal2-confirm btn btn-success']

กดปุ่มส่งกลับไปแก้ไข
    [Documentation]    จังหวัดกดปุ่มส่งกลับไปแก้ไข
    Wait Until Element Is Visible    xpath=//button[contains(text(),'จังหวัดยืนยัน')]    timeout=10s
    Click Button    xpath=//button[contains(text(),'จังหวัดยืนยัน')]
    Click Element    xpath=//button[@class='swal2-confirm btn btn-success']


  
