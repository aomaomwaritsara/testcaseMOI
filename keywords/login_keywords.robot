*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN_URL}    chrome
    Maximize Browser Window
SeleniumLibrary.Wait Until Element Is Visible   //*[@id="loginField"]  


Input Credentials
    [Arguments]    ${username}    ${password}
    
    Input Text    //*[@id="loginField"]  ${username}
   
    Input Text   //*[@id="password"]   ${password}
  
    Click Button    xpath=//input[@value='เข้าสู่ระบบ']


Verify Login Successful
    Wait Until Page Contains    หน้าแรก    timeout=10s
    Capture Page Screenshot

Verify Login Failed
    Wait Until Page Contains    ไม่พบรหัสผู้ใช้ในระบบ   timeout=10s
    Capture Page Screenshot

Close Browser Session
    Close Browser
