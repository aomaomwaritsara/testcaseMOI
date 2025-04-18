*** Settings ***
Library  SeleniumLibrary
Library    BuiltIn


*** Keywords ***

Fill Tab3
    [Documentation]   กดปุ่มเพิ่มข้อมูลแนวทางการดำเนินงาน
    Wait Until Element Is Visible    xpath=//button[@onclick="doCmd('goCreateSubActivity')"]   10s
    Click Button    xpath=//button[@onclick="doCmd('goCreateSubActivity')"]
    Sleep    3s  # รอให้หน้าโหลด 

Add SubActivity
    Wait Until Page Contains    ชื่อกิจกรรมย่อย    10s
    ${subActivity}    Evaluate    random.choice(${subActivity})
    Input Text    xpath=//input[@name='subActivity.subActivity']  ${subActivity}
    Input Text    xpath=//input[@name='subActivity.startDateStr']    01/01/2568
    Input Text    xpath=//input[@name='subActivity.endDateStr']    31/12/2568
    
Select Budget and Payment Type
    [Arguments]    ${budgetType}    ${paymentGruop}    ${paymentType}    ${index}
    Wait Until Element Is Visible    xpath=//select[@name='budgetType']    timeout=15s
    Select From List By Value    xpath=//select[@name='budgetType']    ${budgetType}
    Scroll Element Into View    xpath=//select[@name='paymentGruop']
    Wait Until Element Is Visible    xpath=//select[@name='paymentGruop']    timeout=15s
    Select From List By Value    xpath=//select[@name='paymentGruop']    ${paymentGruop}
    Sleep    3s
    Scroll Element Into View    xpath=//select[@name='paymentType']
    Wait Until Element Is Visible    xpath=//select[@name='paymentType']    timeout=15s
    Select From List By Value    xpath=//select[@name='paymentType']    ${paymentType}
    Sleep    5s
Get Budget Info
    [Arguments]    ${index}
    # สร้าง list สำหรับข้อมูลต่างๆ
    ${budgetTypes}    Create List    200000    300000    400000    600000    500000
    ${paymentGroups}    Create List    210000    310000    410000    610000    510000
    ${paymentTypes}    Create List    5210100    5310100    5410100    5610100    5510100
    ${amounts}    Create List    100000    100000    100000    100000    100000

    ${budgetType}    Get From List    ${budgetTypes}    ${index}
    ${paymentGruop}    Get From List    ${paymentGroups}    ${index}
    Sleep    3s
    ${paymentType}    Get From List    ${paymentTypes}    ${index}
    Sleep    3s
    ${amount}    Get From List    ${amounts}    ${index}

    RETURN    ${budgetType}    ${paymentGruop}    ${paymentType}    ${amount}
    
Add Budget Item
    Scroll Element Into View    xpath=//button[contains(text(),'+ เพิ่มข้อมูล')] 
    Click Button    xpath=//button[contains(text(),'+ เพิ่มข้อมูล')]
    Sleep    3s

Fill Amount and Explanation
    [Arguments]    ${index}    ${amount}
    Scroll Element Into View    xpath=//input[@name='explainList[${index}].amountStr'] 
    Wait Until Element Is Visible    xpath=//input[@name='explainList[${index}].amountStr']    timeout=20s
    Input Text    xpath=//input[@name='explainList[${index}].amountStr']    ${amount}
    Sleep    3s

Save SubActivity
    #กดบันทึกข้อมูลกิจกรรมย่อย
    Scroll Element Into View    xpath=//button[contains(text(),'บันทึก')]
    Click Button    xpath=//button[contains(text(),'บันทึก')]
     Sleep    1s
     
Save Procedure
    #วิธีการดำเนินการ
    Scroll Element Into View    xpath=//input[@id='radioProcedure1']
    Click Element    xpath=//input[@id='radioProcedure1']

Click Next Button Tab3
    Scroll Element Into View    xpath=//button[@id='next-3']
    Wait Until Element Is Visible    xpath=//button[@id='next-3']   10s
    Sleep    1s
    Execute JavaScript    document.getElementById('next-3').click();