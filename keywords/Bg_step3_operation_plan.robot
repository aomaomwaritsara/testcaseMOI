*** Settings ***
Library  SeleniumLibrary
Library    BuiltIn


*** Keywords ***

เพิ่มtab3ข้อมูลแนวทางการดำเนินงาน
    [Documentation]   กดปุ่มเพิ่มข้อมูลแนวทางการดำเนินงาน
    Wait Until Element Is Visible    xpath=//button[@onclick="doCmd('goCreateSubActivity')"]   10s
    Click Button    xpath=//button[@onclick="doCmd('goCreateSubActivity')"]
    Sleep    3s  # รอให้หน้าโหลด 

เพิ่มชื่อกิจกรรมย่อยและวันที่เริ่ม-สิ้นสุด
    Wait Until Page Contains    ชื่อกิจกรรมย่อย    10s
    ${subActivity}    Evaluate    random.choice(${subActivity})
    Input Text    xpath=//input[@name='subActivity.subActivity']  ${subActivity}
    Input Text    xpath=//input[@name='subActivity.startDateStr']    01/10/2566
    Input Text    xpath=//input[@name='subActivity.endDateStr']    30/09/2567
    
เลือกข้อมูลงบประมาณที่ใช้ในกิจกรรมย่อย
    [Arguments]    ${budgetType}    ${paymentGruop}    ${paymentType}    ${index}
    Wait Until Element Is Visible    xpath=//select[@name='budgetType']    timeout=20s
    Select From List By Value    xpath=//select[@name='budgetType']    ${budgetType}
    Scroll Element Into View    xpath=//select[@name='paymentGruop']
    Wait Until Element Is Visible    xpath=//select[@name='paymentGruop']    timeout=20s
    Select From List By Value    xpath=//select[@name='paymentGruop']    ${paymentGruop}
    Sleep    3s
    Scroll Element Into View    xpath=//select[@name='paymentType']
    Wait Until Element Is Visible    xpath=//select[@name='paymentType']    timeout=20s
    Select From List By Value    xpath=//select[@name='paymentType']    ${paymentType}
    Sleep    5s
เพิ่มข้อมูลตามลิสต์ประเภทรายจ่าย
    [Arguments]    ${index}
    # สร้าง list สำหรับข้อมูลต่างๆ
    ${budgetTypes}    Create List        300000    400000    500000
    ${paymentGroups}    Create List      310000    410000    510000
    ${paymentTypes}    Create List       5310100   5410100   5510100
    ${amounts}    Create List    200000    200000    200000    
    ${explains}    Create List    คำชี้แจง1    คำชี้แจง2      คำชี้แจง3   
    ${budgetType}    Get From List    ${budgetTypes}    ${index}
    ${paymentGruop}    Get From List    ${paymentGroups}    ${index}
    Sleep    5s
    ${paymentType}    Get From List    ${paymentTypes}    ${index}
    Sleep    5s
    ${amount}    Get From List    ${amounts}    ${index}
    ${explain}   Get From List    ${explains}    ${index}
    RETURN    ${budgetType}    ${paymentGruop}    ${paymentType}    ${amount}   ${explain}

กดปุ่มเพิ่มข้อมูลงบประมาณ
    Scroll Element Into View    xpath=//button[contains(text(),'+ เพิ่มข้อมูล')] 
    Click Button    xpath=//button[contains(text(),'+ เพิ่มข้อมูล')]
    Sleep    3s

เพิ่มจำนวนเงินและคำชี้แจง
    [Arguments]    ${index}    ${amount}    ${explain}
    Scroll Element Into View    xpath=//input[@name='explainList[${index}].amountStr']
    Wait Until Element Is Visible    xpath=//input[@name='explainList[${index}].amountStr']    timeout=30s
    Input Text    xpath=//input[@name='explainList[${index}].amountStr']    ${amount}
    
    Scroll Element Into View    xpath=//textarea[@name='explainList[${index}].explain']
    Wait Until Element Is Visible    xpath=//textarea[@name='explainList[${index}].explain']    timeout=30s
    Input Text    xpath=//textarea[@name='explainList[${index}].explain']    ${explain}
    Sleep    3s

กดปุ่มบันทึกข้อมูลกิจกรรมย่อย
    Scroll Element Into View    xpath=//button[contains(text(),'บันทึก')]
    Click Button    xpath=//button[contains(text(),'บันทึก')]
    Sleep    1s

เลือกวิธีการดำเนินการ
    Wait Until Element Is Visible    xpath=//input[@id='radioProcedure1']    timeout=20s
    Scroll Element Into View    xpath=//input[@id='radioProcedure1']
    Click Element    xpath=//input[@id='radioProcedure1']
    Wait Until Element Is Visible    xpath=//input[@id='radioProcedure2']    timeout=20s
    Scroll Element Into View    xpath=//input[@id='radioProcedure2']
    Click Element    xpath=//input[@id='radioProcedure2']

กดปุ่มถัดไปเพื่อบันทึกข้อมูลtab3
    Scroll Element Into View    xpath=//button[@id='next-3']
    Wait Until Element Is Visible    xpath=//button[@id='next-3']   10s
    Sleep    1s
    Execute JavaScript    document.getElementById('next-3').click();