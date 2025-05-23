*** Keywords ***
Capture All Errors
    ${errors}=    Create List
    ${toast_errors}=    Get WebElements    xpath=//div[contains(@class,'toast-error') or contains(@class,'alert-danger')]
    :FOR    ${elem}    IN    @{toast_errors}
    \    ${text}=    Get Text    ${elem}
    \    Run Keyword If    '${text}' != ''    Append To List    ${errors}    ${text}
    ${field_errors}=    Get WebElements    xpath=//span[contains(@class,'field-error') or contains(@class,'error-message')]
    :FOR    ${elem}    IN    @{field_errors}
    \    ${text}=    Get Text    ${elem}
    \    Run Keyword If    '${text}' != ''    Append To List    ${errors}    ${text}
    Run Keyword If    ${errors}    Fail    พบข้อผิดพลาดในการบันทึกข้อมูล:\n${errors}

Verify Save Success
    Wait Until Any Element Is Visible    xpath=//div[contains(@class,'alert-success')]    xpath=//div[contains(@class,'toast-error')]    xpath=//div[contains(@class,'alert-danger')]    timeout=10s
    ${success_visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[contains(@class,'alert-success')]
    Run Keyword If    ${success_visible}    Log    ข้อมูลถูกบันทึกสำเร็จ
    Run Keyword If    ${success_visible}    Return From Keyword
    Capture All Errors
