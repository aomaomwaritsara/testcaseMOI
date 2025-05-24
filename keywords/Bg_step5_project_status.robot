*** Settings ***
Library  SeleniumLibrary
Library    BuiltIn

*** Keywords ***

กรอกข้อมูลส่วนที่ 5 ประเภทรายจ่ายประจำ
    [Documentation]    เพิ่ม tab5 สถานะโครงการ
#   ประเภทรายจ่าย > รายจ่ายประจำ
    Wait Until Element Is Visible    xpath=//input[@id='paymentType1']    timeout=10s
    Click Element    xpath=//input[@id='paymentType1']
#   รูปแบบโครงการ 
    Scroll Element Into View    xpath=//select[@name='formData.pattern']
    Wait Until Element Is Visible   xpath=//select[@name='formData.pattern']    timeout=10s
    Select From List By Value    xpath=//select[@name='formData.pattern']    IMP
    Sleep    1s

กรอกข้อมูลส่วนที่ 5 ประเภทรายจ่ายลงทุน
    [Documentation]    เพิ่ม tab5 สถานะโครงการ
#   ประเภทรายจ่าย > รายจ่ายประจำ
    Wait Until Element Is Visible    xpath=//input[@id='paymentType2']    timeout=10s
    Click Element    xpath=//input[@id='paymentType2']
#   รูปแบบโครงการ 
    Scroll Element Into View    xpath=//select[@name='formData.pattern']
    Wait Until Element Is Visible   xpath=//select[@name='formData.pattern']    timeout=10s
    Select From List By Value    xpath=//select[@name='formData.pattern']    IMP
    Sleep    1s
    
กดปุ่มบันทึกข้อมูลสถานะบันทึกร่าง
    [Documentation]    กดปุ่มบันทึกร่างและรอให้ระบบแสดงบันทึกข้อมูลเรียบร้อย
    Wait Until Element Is Visible    xpath=//button[@id='savePage5' and normalize-space(text())='บันทึก']    timeout=20s
    Scroll Element Into View    xpath=//button[@id='savePage5' and normalize-space(text())='บันทึก']
    Click Button    xpath=//button[@id='savePage5' and normalize-space(text())='บันทึก']
# รอให้ข้อความยืนยันการบันทึกปรากฏ
    Wait Until Page Contains    บันทึกข้อมูลเรียบร้อย    timeout=20s
# คลิกที่หน้าจอเพื่อให้ popup หายไป
    Click Element    xpath=//body
# รอให้ป๊อปอัปหายไปก่อน
    Wait Until Element Is Not Visible    xpath=//div[contains(@class, 'swal2-container')]    timeout=30s
    Sleep    1s

กดปุ่มยืนยันข้อมูล
    [Documentation]    กดปุ่มยืนยันข้อมูลและรอให้ระบบแสดงบันทึกข้อมูลเรียบร้อย
    Wait Until Element Is Visible    xpath=//button[@id='savePage5' and normalize-space(text())='ยืนยันข้อมูล']    timeout=20s
    Scroll Element Into View    xpath=//button[@id='savePage5' and normalize-space(text())='ยืนยันข้อมูล']
    Click Button    xpath=//button[@id='savePage5' and normalize-space(text())='ยืนยันข้อมูล']
    Wait Until Element Is Visible    xpath=//div[contains(@class,'alert-success') and contains(text(),'บันทึกข้อมูลเรียบร้อย')]    timeout=15s
# คลิกที่หน้าจอเพื่อให้ popup หายไป
    Click Element    xpath=//body
# รอให้ป๊อปอัปหายไปก่อน
    Wait Until Element Is Not Visible    xpath=//div[contains(@class, 'swal2-container')]    timeout=30s
    Sleep    1s