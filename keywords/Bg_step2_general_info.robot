*** Settings ***
Library  SeleniumLibrary
Library    BuiltIn


*** Keywords ***

กรอกข้อมูลtab2ส่วนที่1:ข้อมูลทั่วไปของโครงการ
   [Documentation]    เพิ่ม tab2 ส่วนที่ 1 ข้อมูลทั่วไปโครงการ
    # คลิกแท็บขยาย
    
#  วัตถุประสงค์ของโครงการ
    Wait Until Element Is Visible    xpath=//textarea[@name='formData.projectObjective']    timeout=10s
    Input Text    xpath=//textarea[@name='formData.projectObjective']   ${projectObjective}

#   สถานภาพของโครงการ
    Wait Until Element Is Visible    xpath=//input[@id='radioProjectStatus2']  timeout=10s
    Click Element    xpath=//input[@id='radioProjectStatus2'] 
     ${is_selected}    Get Element Attribute    xpath=//input[@id='radioProjectStatus2']    checked
    Should Be Equal As Strings    ${is_selected}    true 

#   ประเภทของโครงการ
    Wait Until Element Is Visible    xpath=//input[@id='radioNewProject2']    timeout=10s
    Click Element    xpath=//input[@id='radioNewProject2']
    ${is_selected2}    Get Element Attribute    xpath=//input[@id='radioNewProject2']    checked
    Should Be Equal As Strings    ${is_selected2}    true 

#   ปีเริ่มต้น
    Wait Until Element Is Visible    xpath=//input[@name='formData.stratYear']  timeout=10s
    Input Text    xpath=//input[@name='formData.stratYear']   2568
#   ปีสิ้นสุด 
    Wait Until Element Is Visible    xpath=//input[@name='formData.endYear']  timeout=10s
    Input Text    xpath=//input[@name='formData.endYear']   2569

กรอกข้อมูลtab2ส่วนที่2:สถานที่ดำเนินโครงการ
# คลิกแท็บขยาย
  #  Wait Until Element Is Visible   xpath=//button[contains(text(),'ส่วนที่ 2 :สถานที่ดำเนินโครงการ')]  timeout=10s
  #  Scroll Element Into View      xpath=//button[contains(text(),'ส่วนที่ 2 :สถานที่ดำเนินโครงการ')]
  #  Wait Until Element Is Enabled    xpath=//button[contains(text(),'ส่วนที่ 2 :สถานที่ดำเนินโครงการ')]   timeout=5s
  #  Execute JavaScript    document.evaluate("//button[contains(text(),'ส่วนที่ 2 :สถานที่ดำเนินโครงการ')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

#    เพิ่มสถานที่ดำเนินโครงการ
    Wait Until Element Is Visible   xpath=//a[contains(@class, 'ic-edit')]    timeout=10s
    Scroll Element Into View      xpath=//a[contains(@class, 'ic-edit')] 
    Wait Until Element Is Enabled    xpath=//a[@class='ic-edit d-inline-block mx-2']   timeout=5s
    Click Element    xpath=//a[contains(@class, 'ic-edit')]
         Wait Until Page Contains    เลขที่    10s
         Input Text    xpath=//input[@name='loc.locNo']    101
         Wait Until Page Contains    หมู่ที่    10s
         Input Text    xpath=//input[@name='loc.mooNo']   2
         Wait Until Page Contains    ตรอก/ซอย    10s
         Input Text    xpath=//input[@name='loc.soi']    3
         Wait Until Page Contains    ถนน    10s
         Input Text    xpath=//input[@name='loc.road']   พหลโยธิน
         Wait Until Element Is Visible    xpath=//select[@name='loc.provinceId']     15s
         Select From List By Value    xpath=//select[@name='loc.provinceId']   20
         Wait Until Element Is Visible    xpath=//select[@name='loc.amphurId']     15s
         Select From List By Value    xpath=//select[@name='loc.amphurId']    2011
         Wait Until Element Is Visible    xpath=//select[@name='loc.districtCode']    15s
         Select From List By Value    xpath=//select[@name='loc.districtCode']    201101
         Input Text    xpath=//input[@name='loc.zipCode']  12345
         Input Text    xpath=//input[@name='loc.lat']    12.009
         Input Text    xpath=//input[@name='loc.lon']    20.999
         Scroll Element Into View      xpath=//button[contains(text(),'บันทึก')]
         Click Button    xpath=//button[contains(text(),'บันทึก')]

กรอกข้อมูลtab2ส่วนที่3:กลุ่มเป้าหมายและผู้มีส่วนได้ส่วนเสีย
# คลิกแท็บขยาย
    Wait Until Element Is Visible   xpath=//button[contains(text(),'ส่วนที่ 3 : กลุ่มเป้าหมาย และผู้มีส่วนได้ส่วนเสีย')]  timeout=10s
    Scroll Element Into View      xpath=//button[contains(text(),'ส่วนที่ 3 : กลุ่มเป้าหมาย และผู้มีส่วนได้ส่วนเสีย')]
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'ส่วนที่ 3 : กลุ่มเป้าหมาย และผู้มีส่วนได้ส่วนเสีย')]  timeout=5s
    Execute JavaScript    document.evaluate("//button[contains(text(),'ส่วนที่ 3 : กลุ่มเป้าหมาย และผู้มีส่วนได้ส่วนเสีย')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

#    กลุ่มเป้าหมาย
    Scroll Element Into View    xpath=//input[@name='formData.targetGroup']
    Wait Until Element Is Visible    xpath=//input[@name='formData.targetGroup']    10s
    Input Text    xpath=//input[@name='formData.targetGroup']    ${targetGroup}
    
#    ผู้มีส่วนได้ส่วนเสีย
    Scroll Element Into View    xpath=//input[@name='formData.stakeHolder']
    Wait Until Element Is Visible    xpath=//input[@name='formData.stakeHolder']   10s
    Input Text    xpath=//input[@name='formData.stakeHolder']    ${stakeHolder}

กรอกข้อมูลtab2ส่วนที่4:เป้าหมาย ผลลัพท์ และผลกระทบโครงการ
# คลิกแท็บขยาย
    Wait Until Element Is Visible   xpath=//button[contains(text(),'ส่วนที่ 4 : เป้าหมาย ผลลัพท์ และผลกระทบโครงการ')]  timeout=10s
    Scroll Element Into View      xpath=//button[contains(text(),'ส่วนที่ 4 : เป้าหมาย ผลลัพท์ และผลกระทบโครงการ')]
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'ส่วนที่ 4 : เป้าหมาย ผลลัพท์ และผลกระทบโครงการ')]  timeout=5s
    Execute JavaScript    document.evaluate("//button[contains(text(),'ส่วนที่ 4 : เป้าหมาย ผลลัพท์ และผลกระทบโครงการ')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

#   เป้าหมายโครงการ ตัวชี้วัด
    Scroll Element Into View    xpath=//textarea[@name='formData.indicator']
    Wait Until Element Is Visible    xpath=//textarea[@name='formData.indicator']    10s
    Input Text    xpath=//textarea[@name='formData.indicator']    ${indicator}
    
#   ผลผลิต
    Scroll Element Into View    xpath=//textarea[@name='formData.product']
    Wait Until Element Is Visible    xpath=//textarea[@name='formData.product']   10s
    Input Text    xpath=//textarea[@name='formData.product']    ${product}

#   ผลลัพธ์
    Scroll Element Into View    xpath=//textarea[@name='formData.projectResult']
    Wait Until Element Is Visible    xpath=//textarea[@name='formData.projectResult']   10s
    Input Text    xpath=//textarea[@name='formData.projectResult']    ${projectResult}

#   ผลกระทบเชิงบวก
    Scroll Element Into View    xpath=//textarea[@name='formData.positiveImpact']
    Wait Until Element Is Visible    xpath=//textarea[@name='formData.positiveImpact']   10s
    Input Text    xpath=//textarea[@name='formData.positiveImpact']   ${positiveImpact}

#   ผลกระทบเชิงลบ
    Scroll Element Into View    xpath=//textarea[@name='formData.negativeImpact']
    Wait Until Element Is Visible    xpath=//textarea[@name='formData.negativeImpact']   10s
    Input Text    xpath=//textarea[@name='formData.negativeImpact']    ${negativeImpact}

กดปุ่มถัดไปเพื่อบันทึกข้อมูลTab2
    Scroll Element Into View    xpath=//button[@id='next-2']
    Wait Until Element Is Visible    xpath=//button[@id='next-2']   10s
    Sleep    1s
    Execute JavaScript    document.getElementById('next-2').click();