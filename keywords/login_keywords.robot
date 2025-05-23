*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

Open Browser To Application
    Open Browser    ${LOGIN_URL}    chrome
    Maximize Browser Window
SeleniumLibrary.Wait Until Element Is Visible   //*[@id="loginField"]  


กรอกข้อมูลเข้าสู่ระบบ
    [Arguments]    ${username}    ${password}
    
    Input Text    //*[@id="loginField"]  ${username}
   
    Input Text   //*[@id="password"]   ${password}
  
    Click Button    xpath=//input[@value='เข้าสู่ระบบ']


ล็อคอินถูกต้อง
    Wait Until Page Contains    หน้าแรก    
   

ล็อคอินไม่ถูกต้อง
    Wait Until Page Contains    ไม่พบรหัสผู้ใช้ในระบบ   
    


Close Browser
    Close Browser
