*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
กบจเข้าเมนูแบบคำขอ
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

กดปุ่มเห็นชอบ
    [Documentation]    กบจ กดปุ่มเห็นชอบ
    Wait Until Element Is Visible    xpath=//button[contains(text(),'เห็นชอบ')]    timeout=10s
    Click Button    xpath=//button[contains(text(),'เห็นชอบ')]
    Click Element    xpath=//button[@class='swal2-confirm btn btn-success']

กดปุ่มไม่เห็นชอบ
    [Documentation]    กบจ กดปุ่มไม่เห็นชอบ
    Wait Until Element Is Visible    xpath=//button[contains(text(),'ไม่เห็นชอบ')]    timeout=10s
    Click Button    xpath=//button[contains(text(),'ไม่เห็นชอบ')]
    Click Element    xpath=//button[@class='swal2-confirm btn btn-success']

กดปุ่มส่งกลับจังหวัดแก้ไข
    [Documentation]    กบจ กดปุ่มส่งกลับจังหวัดแก้ไข
    Wait Until Element Is Visible    xpath=//button[contains(text(),'ส่งกลับจังหวัดแก้ไข')]    timeout=10s
    Click Button    xpath=//button[contains(text(),'ส่งกลับจังหวัดแก้ไข')]
    Click Element    xpath=//button[@class='swal2-confirm btn btn-success']

กดปุ่มส่งกลับส่วนราชการแก้ไข
    [Documentation]    กบจ กดปุ่มส่งกลับส่วนราชการแก้ไข
    Wait Until Element Is Visible    xpath=//button[contains(text(),'ส่งกลับส่วนราชการแก้ไข')]    timeout=10s
    Click Button    xpath=//button[contains(text(),'ส่งกลับส่วนราชการแก้ไข')]
    Click Element    xpath=//button[@class='swal2-confirm btn btn-success']


  
