*** Settings ***
Library  SeleniumLibrary
Library    BuiltIn

*** Keywords ***

Fill Tab5
    [Documentation]    เพิ่ม tab5 สถานะโครงการ
#   ประเภทรายจ่าย > รายจ่ายประจำ
    Wait Until Element Is Visible    xpath=//input[@id='paymentType2']    timeout=10s
    Click Element    xpath=//input[@id='paymentType2']
#   รูปแบบโครงการ 
    Scroll Element Into View    xpath=//select[@name='formData.pattern']
    Wait Until Element Is Visible   xpath=//select[@name='formData.pattern']    timeout=10s
    Select From List By Value    xpath=//select[@name='formData.pattern']    IMP
    Sleep    1s
Click Submit Button
#   กดปุ่มบันทึก
    Wait Until Element Is Visible    xpath=(//button[@id='savePage5'])[1]    timeout=20s
    Scroll Element Into View    xpath=//button[@id='savePage5']
    Sleep    1s
    Execute JavaScript    document.getElementById('savePage5').click();
# รอให้ข้อความยืนยันการบันทึกปรากฏ
    Wait Until Page Contains    บันทึกข้อมูลเรียบร้อย    timeout=20s
# คลิกที่หน้าจอเพื่อให้ popup หายไป
    Click Element    xpath=//body
# รอให้ป๊อปอัปหายไปก่อน
    Wait Until Element Is Not Visible    xpath=//div[contains(@class, 'swal2-container')]    timeout=30s
    Sleep    1s
