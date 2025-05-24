*** Settings ***
Library  SeleniumLibrary
Library    BuiltIn

*** Keywords ***
กรอกข้อมูลtab4ส่วนที่1:ข้อมูลทั่วไปของโครงการ
    [Documentation]    เพิ่ม tab4 ส่วนที่ 1 ความพร้อมของโครงการ
#   รายงานความสำเร็จของการดำเนินงานที่ผ่านมา
    Wait Until Element Is Visible    xpath=//textarea[@name='formData.successReport']    timeout=10s
    Input Text    xpath=//textarea[@name='formData.successReport']    -
#   ภารกิจขององค์กรปกครองส่วนท้องถิ่น
    Wait Until Element Is Visible    xpath=//input[@id='localMission1']    timeout=10s
    Click Element    xpath=//input[@id='localMission1']

กรอกข้อมูลtab4ส่วนที่2:ความพร้อมของโครงการ
# คลิกแท็บขยาย
    Wait Until Element Is Visible   xpath=//button[contains(text(),'ส่วนที่ 2 : ความพร้อมของโครงการ')]    timeout=10s
    Scroll Element Into View      xpath=//button[contains(text(),'ส่วนที่ 2 : ความพร้อมของโครงการ')]
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'ส่วนที่ 2 : ความพร้อมของโครงการ')]  timeout=5s
    Execute JavaScript    document.evaluate("//button[contains(text(),'ส่วนที่ 2 : ความพร้อมของโครงการ')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    3s
#   พื้นที่ดำเนินโครงการ
    Scroll Element Into View    xpath=//input[@id='radioProjectArea1']
    Wait Until Element Is Visible    xpath=//input[@id='radioProjectArea1']   timeout=10s
    Click Element    xpath=//input[@id='radioProjectArea1']
#   แบบรูปรายการ/แผนการปฏิบัติงาน radio
    Scroll Element Into View    xpath=//input[@id='radioPlan1']
    Wait Until Element Is Visible    xpath=//input[@id='radioPlan1']   timeout=10s
    Click Element    xpath=//input[@id='radioPlan1']
#   แบบรูปรายการ/แผนการปฏิบัติงาน input
    Scroll Element Into View    xpath=//input[@id='wpDesc1']
    Wait Until Element Is Visible    xpath=//input[@id='wpDesc1']  timeout=10s
    Input Text    xpath=//input[@id='wpDesc1']     รายการปกครองส่วนท้องถิ่น
#   บุคลากรมีประสบการณ์
    Scroll Element Into View    xpath=//input[@id='radioExperiencedStaff1']
    Wait Until Element Is Visible    xpath=//input[@id='radioExperiencedStaff1']   timeout=10s
    Click Element    xpath=//input[@id='radioExperiencedStaff1']
#   เครื่องมือดำเนินการ
    Scroll Element Into View    xpath=//input[@id='radioOperationTools1']
    Wait Until Element Is Visible    xpath=//input[@id='radioOperationTools1']   timeout=10s
    Click Element    xpath=//input[@id='radioOperationTools1']
#   เทคนิคในการบริหารจัดการ
    Scroll Element Into View    xpath=//input[@id='radioManagementTechniques1'] 
    Wait Until Element Is Visible    xpath=//input[@id='radioManagementTechniques1']    timeout=10s
    Click Element    xpath=//input[@id='radioManagementTechniques1']
#   ผลกระทบสิ่งแวดล้อม
    Scroll Element Into View    xpath=//input[@id='radioFs1']
    Wait Until Element Is Visible    xpath=//input[@id='radioEnvironmentalImpact1']    timeout=10s
    Click Element    xpath=//input[@id='radioEnvironmentalImpact1']
#   รายงานการศึกษาความเหมาะสม (FS)
    Scroll Element Into View    xpath=//input[@id='radioFs1']
    Wait Until Element Is Visible    xpath=//input[@id='radioFs1']   timeout=10s
    Click Element    xpath=//input[@id='radioFs1']

กรอกข้อมูลtab4ส่วนที่3:วิธีการบริหารจัดการเมื่อโครงการแล้วเสร็จ
# คลิกแท็บขยาย
    Wait Until Element Is Visible   xpath=//button[contains(text(),'ส่วนที่ 3 : วิธีการบริหารจัดการหรือการดูแลบำรุงรัก')]   timeout=10s
    Scroll Element Into View      xpath=//button[contains(text(),'ส่วนที่ 3 : วิธีการบริหารจัดการหรือการดูแลบำรุงรัก')]
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'ส่วนที่ 3 : วิธีการบริหารจัดการหรือการดูแลบำรุงรัก')]  timeout=5s
    Execute JavaScript    document.evaluate("//button[contains(text(),'ส่วนที่ 3 : วิธีการบริหารจัดการหรือการดูแลบำรุงรัก')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s
#   วิธีการบริหารจัดการหรือการดูแลบำรุงรักษา เมื่อโครงการแล้วเสร็จ เพื่อให้เกิดความยั่งยืนของโครงการ
    Scroll Element Into View    xpath=//textarea[@name='formData.maintain'] 
    Wait Until Element Is Visible    xpath=//textarea[@name='formData.maintain']   timeout=10s
    Input Text    xpath=//textarea[@name='formData.maintain']    ${maintain}
#   ปัญหา อุปสรรค์และข้อจำกัด
    Scroll Element Into View    xpath=//textarea[@name='formData.obstacle'] 
    Wait Until Element Is Visible    xpath=//textarea[@name='formData.obstacle']  timeout=10s
    Input Text    xpath=//textarea[@name='formData.obstacle']    ${obstacle}

กดปุ่มถัดไปเพื่อบันทึกข้อมูลtab4
    Scroll Element Into View    xpath=//button[@id='next-4']
    Wait Until Element Is Visible    xpath=//button[@id='next-4']   10s
    Sleep    1s
    Execute JavaScript    document.getElementById('next-4').click();