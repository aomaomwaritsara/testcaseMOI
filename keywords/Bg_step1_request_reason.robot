*** Settings ***
Library  SeleniumLibrary
Library  Collections  # ใช้สำหรับสุ่มข้อมูลจาก List
Library  String  # ใช้สำหรับสร้างชื่อแบบสุ่ม
Library    DateTime
Library    BuiltIn

*** Keywords ***
เข้าเมนูข้อมูลแบบคำขอ
    [Documentation]    เข้าเมนูเพิ่มข้อมูลแบบคำขอ
    Wait Until Element Is Visible   xpath=//span[contains(text(),'ระบบแพลตฟอร์มกลางข้อมูลกระทรวงมหาดไทย')]   timeout=10s
    Click Element     xpath=//span[contains(text(),'ระบบแพลตฟอร์มกลางข้อมูลกระทรวงมหาดไทย')]  
    Wait Until Element Is Visible    xpath=//a[contains(text(),'บันทึกคำของบประมาณโครงการ')]  timeout=10s
    Click Element     xpath=//a[contains(text(),'บันทึกคำของบประมาณโครงการ')] 
    Wait Until Element Is Visible    xpath=//a[contains(text(),'แบบคำของบประมาณ')]    timeout=10s
    Click Element    xpath=//a[contains(text(),'แบบคำของบประมาณ')]
    Wait Until Page Contains    แบบคำของบประมาณ    timeout=10s
กดปุ่มเพิ่มข้อมูลแบบคำขอ
    [Documentation]   กดปุ่มเพิ่มข้อมูลแบบคำขอ
    Wait Until Element Is Visible    xpath=//button[contains(text(),'เพิ่มข้อมูล')]    10s
    Click Button    xpath=//button[contains(text(),'เพิ่มข้อมูล')]
    Sleep    5s  # รอให้หน้าโหลด 
กรอกข้อมูลtab1ส่วนที่1:ข้อมูล
    [Documentation]    เพิ่ม tab1 ส่วนที่ 1 ข้อมูล
    Sleep    5s  # รอให้หน้าโหลดก่อน   
#   เลือก ปีงบประมาณ (บังคับเลือก 2567)
    Wait Until Page Contains    ปีงบประมาณ    10s
    Wait Until Element Is Visible    xpath=//select[@name='formData.fisicalYear']   10s
    Select From List By Value    xpath=//select[@name='formData.fisicalYear']   2567  
# 🔹 เลือก จังหวัด (บังคับเลือก 20)
    #Wait Until Page Contains    จังหวัด    10s
    #Wait Until Element Is Visible    xpath=//select[contains(@name,'province')]   15s
    #Select From List By Value    xpath=//select[contains(@name,'province')]    20
#  เลือก ประเด็นการพัฒนาของจังหวัด (บังคับเลือก 13)
    Wait Until Page Contains    ประเด็นการพัฒนาของจังหวัด    10s
    Wait Until Element Is Visible   xpath=//select[@name='annualPlanId']    timeout=10s
    Click Element    xpath=//select[@name='annualPlanId']
    ${element_annualPlanId}    Get WebElement    xpath=//select[@name='annualPlanId']
    Run Keyword And Warn On Failure     Select From List By Value     ${element_annualPlanId}   15
    Sleep    3s  # รอให้ค่าใน dropdown ถูกอัปเดต
    #${annualPlan}    Get Selected List Label    xpath=//select[@name='annualPlanId']
    #Log    ค่าในดรอปดาวน์: ${annualPlan}  
#   เลือก แผนงาน (บังคับเลือก 12)
    Wait Until Page Contains    แผนงาน    10s
    Wait Until Element Is Visible    xpath=//select[@name='workPlanId']    timeout=10s
    Click Element    xpath=//select[@name='workPlanId']
    ${element_workPlan}    Get WebElement    xpath=//select[@name='workPlanId']
    Run Keyword And Warn On Failure   Select From List By Value     ${element_workPlan}   17
    Sleep    3s  # รอให้ค่าใน dropdown ถูกอัปเดต
    #${workPlan}    Get Selected List Label    xpath=//select[@name='workPlanId']
    #Log    ค่าในดรอปดาวน์: ${workPlan}  
#   เลือก ชื่อโครงการ (บังคับเลือก 10)
     Wait Until Page Contains    ชื่อโครงการ    10s
     Wait Until Element Is Visible   xpath=//select[@name='projectId']    timeout=10s
     Click Element    xpath=//select[@name='projectId']
     ${element_project}    Get WebElement    xpath=//select[@name='projectId']
     Run Keyword And Warn On Failure    Select From List By Value     ${element_project}  26
     Sleep    3s  # รอให้ค่าใน dropdown ถูกอัปเดต
     #${project}    Get Selected List Label    xpath=//select[@name='projectId']
     #Log    ค่าในดรอปดาวน์: ${project}    
#   กรอกชื่อกิจกรรมหลัก (สร้างชื่อสุ่ม)
    Wait Until Page Contains    กิจกรรมหลัก    10s
    # สุ่มเลือกกิจกรรมจาก ACTIVITY_NAMES ที่ได้จาก testdata
    ${activity}=    Evaluate    random.choice(${ACTIVITY_NAMES})    modules=random
    # ดึงวันที่และเวลาปัจจุบันในรูปแบบ YYYYMMDD-HH:MM:SS
    ${DATE_TIME}=    Get Current Date    result_format=%d%m%Y-%H:%M:%S
    # รวมวันที่ + เวลา + ชื่อกิจกรรม
    ${activity_with_time}=    Set Variable    ${DATE_TIME} (${activity})
    # กรอกข้อมูลลงในฟอร์ม
    Input Text    xpath=//input[@name='formData.mainActivity']    ${activity_with_time}
    # รอให้ input ปรากฏเพื่อความแน่ใจ
    Wait Until Element Is Visible    xpath=//input[@name='formData.mainActivity']    timeout=10s
    Sleep    3s 
 # 🔹 เลือก ยุทธศาสตร์ชาติ ดึงค่าจากประเด็นพัฒนา
 # 🔹 เลือก แผนแม่บท ดึงค่าจากประเด็นพัฒนา
# เลือกแผนพัฒนาเศรษฐกิจและสังคมแห่งชาติ
    Scroll Element Into View      xpath=//select[@name='formData.businessPlan']
     Wait Until Page Contains    แผนพัฒนาเศรษฐกิจและสังคมแห่งชาติ    10s
     Wait Until Element Is Visible   xpath=//select[@name='formData.businessPlan']  timeout=10s
     Click Element    xpath=//select[@name='formData.businessPlan']
     ${element_businessPlan}    Get WebElement    xpath=//select[@name='formData.businessPlan']
     Run Keyword And Warn On Failure    Select From List By Value     ${element_businessPlan}  P1301
     Sleep    3s 
#  SDGs 
     Scroll Element Into View      xpath=//select[@name='formData.sdgs']
     Wait Until Page Contains    SDGs    10s
     Wait Until Element Is Visible   xpath=//select[@name='formData.sdgs']  timeout=10s
     Click Element    xpath=//select[@name='formData.sdgs']
     ${element_sdgs}    Get WebElement    xpath=//select[@name='formData.sdgs']
     Run Keyword And Warn On Failure    Select From List By Value     ${element_sdgs}  1
     Sleep    3s 

กรอกข้อมูลtab1ส่วนที่2:ข้อมูลผู้รับผิดชอบ
    [Documentation]    เพิ่ม tab1 ส่วนที่ 2 ข้อมูลผู้รับผิดชอบ
# คลิกแท็บขยาย
    Wait Until Element Is Visible   xpath=//button[contains(text(),'ส่วนที่ 2 : ข้อมูลผู้รับผิดชอบ')]    timeout=10s
    Scroll Element Into View      xpath=//button[contains(text(),'ส่วนที่ 2 : ข้อมูลผู้รับผิดชอบ')]
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'ส่วนที่ 2 : ข้อมูลผู้รับผิดชอบ')]    timeout=5s
    Click Button    xpath=//button[contains(text(),'ส่วนที่ 2 : ข้อมูลผู้รับผิดชอบ')]
    Sleep    3s 
# เลือก หน่วยดำเนินการ   
#  กรอกผู้รับผิดชอบ(สร้างชื่อสุ่ม)
    Wait Until Page Contains    ผู้รับผิดชอบ    10s
    ${responsePersons}    Evaluate    random.choice(${RESPONSEPERSON})
    Input Text    xpath=//input[@name='formData.responsePerson']   ${responsePersons}
    Sleep    3s 
#   กรอกตำแหน่ง
    Wait Until Element Is Visible    xpath=//input[@name='formData.position']    timeout=10s
    Input Text    xpath=//input[@name='formData.position']    นักวิชาการ
#   สถานที่ติดต่อ
    Wait Until Page Contains    สถานที่ติดต่อ    10s
    Input Text    xpath=//input[@name='formData.contractLocation']    ที่อยู่สำนักงาน
#   หมายเลขโทรศัพท์
    Wait Until Page Contains    หมายเลขโทรศัพท์    10s
    Input Text    xpath=//input[@name='formData.tel']   0212828333 ต่อ 1
กรอกข้อมูลtab1ส่วนที่3:หลักการและเหตุผล
    [Documentation]    เพิ่ม tab1 ส่วนที่ 3 หลักการและเหตุผล
    # คลิกแท็บขยาย
    Wait Until Element Is Visible   xpath=//button[contains(text(),'ส่วนที่ 3 : หลักการและเหตุผล')]  timeout=10s
    Scroll Element Into View      xpath=//button[contains(text(),'ส่วนที่ 3 : หลักการและเหตุผล')]
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'ส่วนที่ 3 : หลักการและเหตุผล')]   timeout=5s
    Execute JavaScript    document.evaluate("//button[contains(text(),'ส่วนที่ 3 : หลักการและเหตุผล')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
#   กรอกที่มา
    Wait Until Element Is Visible    xpath=//textarea[@name='formData.reason']   timeout=10s
    Input Text    xpath=//textarea[@name='formData.reason']    ${reason}

กรอกข้อมูลtab1ส่วนที่4:สรุปสาระสำคัญ
   [Documentation]    เพิ่ม tab1 ส่วนที่ 4 สรุปสาระสำคัญ
    # คลิกแท็บขยาย
    Wait Until Element Is Visible   xpath=(//button[contains(text(),'ส่วนที่ 4 : สรุปสาระสำคัญ')])[1]   timeout=10s
    Scroll Element Into View      xpath=(//button[contains(text(),'ส่วนที่ 4 : สรุปสาระสำคัญ')])[1]
    Wait Until Element Is Enabled    xpath=(//button[contains(text(),'ส่วนที่ 4 : สรุปสาระสำคัญ')])[1]   timeout=5s
    Execute JavaScript     document.evaluate("(//button[contains(text(),'ส่วนที่ 4 : สรุปสาระสำคัญ')])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    
#   สภาพปัญหา/ความต้องการ
    Wait Until Element Is Visible    xpath=//textarea[@name='formData.problem']  timeout=10s
    Input Text    xpath=//textarea[@name='formData.problem']   ${problem}

#   ความเร่งด่วน
    Wait Until Element Is Visible    xpath=//textarea[@name='formData.urgency']  timeout=10s
    Input Text    xpath=//textarea[@name='formData.urgency']   ${urgency}

กดปุ่มถัดไปเพื่อบันทึกข้อมูลtab1
    Scroll Element Into View    xpath=//button[@id='next-1']
    Wait Until Element Is Visible    xpath=//button[@id='next-1']   10s
    Sleep    1s
    Execute JavaScript    document.getElementById('next-1').click();
