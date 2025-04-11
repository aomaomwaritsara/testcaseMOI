*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Go To Budget Request Page
  [Documentation]    เข้าเมนูเพิ่มข้อมูลแบบคำขอ
    Wait Until Element Is Visible   xpath=//span[contains(text(),'ระบบแพลตฟอร์มกลางข้อมูลกระทรวงมหาดไทย')]   timeout=10s
    Click Element     xpath=//span[contains(text(),'ระบบแพลตฟอร์มกลางข้อมูลกระทรวงมหาดไทย')]  

    Wait Until Element Is Visible    xpath=//a[contains(text(),'บันทึกคำของบประมาณโครงการ')]  timeout=10s
    Click Element     xpath=//a[contains(text(),'บันทึกคำของบประมาณโครงการ')] 

    Wait Until Element Is Visible    xpath=//a[contains(text(),'แบบคำของบประมาณ')]    timeout=10s
    Click Element    xpath=//a[contains(text(),'แบบคำของบประมาณ')]
   
    Wait Until Page Contains    แบบคำของบประมาณ    timeout=10s
Click Add Budget Request
   [Documentation]   กดปุ่มเพิ่มข้อมูลแบบคำขอ
    Wait Until Element Is Visible    xpath=//button[contains(text(),'เพิ่มข้อมูล')]    10s
    Click Button    xpath=//button[contains(text(),'เพิ่มข้อมูล')]
    Sleep    5s  # รอให้หน้าโหลด
  
Fill Budget Request Form Part1
    [Documentation]    เพิ่ม tab1 ส่วนที่ 1 ข้อมูล
    Wait Until Element Is Visible   xpath=(//button[@type='button'][contains(text(),'ส่วนที่ 1 : ข้อมูล')])[1]  timeout=10s
    Click Button    xpath=(//button[@type='button'][contains(text(),'ส่วนที่ 1 : ข้อมูล')])[1]
    Sleep   5s  # รอให้หน้าโหลดก่อน
  
 Fill Budget Request Form Part2
    [Documentation]    เพิ่ม tab1 ส่วนที่ 2 ข้อมูลผู้รับผิดชอบ
    # คลิกแท็บขยาย
    Wait Until Element Is Visible   xpath=//button[contains(text(),'ส่วนที่ 2 : ข้อมูลผู้รับผิดชอบ')]    timeout=10s
    Scroll Element Into View      xpath=//button[contains(text(),'ส่วนที่ 2 : ข้อมูลผู้รับผิดชอบ')]
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'ส่วนที่ 2 : ข้อมูลผู้รับผิดชอบ')]    timeout=5s
    Click Button    xpath=//button[contains(text(),'ส่วนที่ 2 : ข้อมูลผู้รับผิดชอบ')]
    
Fill Budget Request Form Part3
    [Documentation]    เพิ่ม tab1 ส่วนที่ 3 หลักการและเหตุผล
    # คลิกแท็บขยาย
    Wait Until Element Is Visible   xpath=//button[contains(text(),'ส่วนที่ 3 : หลักการและเหตุผล')]  timeout=10s
    Scroll Element Into View      xpath=//button[contains(text(),'ส่วนที่ 3 : หลักการและเหตุผล')]
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'ส่วนที่ 3 : หลักการและเหตุผล')]   timeout=5s
    Execute JavaScript    document.evaluate("//button[contains(text(),'ส่วนที่ 3 : หลักการและเหตุผล')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    
Fill Budget Request Form Part4
    [Documentation]    เพิ่ม tab1 ส่วนที่ 4 สรุปสาระสำคัญ
    # คลิกแท็บขยาย
    Wait Until Element Is Visible   xpath=(//button[contains(text(),'ส่วนที่ 4 : สรุปสาระสำคัญ')])[1]   timeout=10s
    Scroll Element Into View      xpath=(//button[contains(text(),'ส่วนที่ 4 : สรุปสาระสำคัญ')])[1]
    Wait Until Element Is Enabled    xpath=(//button[contains(text(),'ส่วนที่ 4 : สรุปสาระสำคัญ')])[1]   timeout=5s
    Execute JavaScript     document.evaluate("(//button[contains(text(),'ส่วนที่ 4 : สรุปสาระสำคัญ')])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    
Click Submit Button
    Wait Until Element Is Visible    xpath=(//button[@type='button'][contains(text(),'ยกเลิก')])[1]   15s
    Scroll Element Into View    xpath=(//button[@type='button'][contains(text(),'ยกเลิก')])[1]
    Sleep    1s
    Click Button    xpath=(//button[@type='button'][contains(text(),'ยกเลิก')])[1]
    Sleep    3s  # รอให้ค่าใน dropdown ถูกอัปเดต


Click Next Button Tab1
    Scroll Element Into View    xpath=//button[@id='next-1']
    Wait Until Element Is Visible    xpath=//button[@id='next-1']   10s
    Sleep    1s
    Execute JavaScript    document.getElementById('next-1').click();
    Sleep    3s  # รอให้ค่าใน dropdown ถูกอัปเดต

