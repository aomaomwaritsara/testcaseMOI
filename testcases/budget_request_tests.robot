*** Settings ***
Documentation    Test cases for Budget Request Functionality
Resource    ../resources/config.robot
Resource    ../resources/testdata.robot
Resource    ../keywords/login_keywords.robot
Resource    ../keywords/Bg_step1_request_reason.robot
Resource    ../keywords/Bg_step2_general_info.robot
Resource    ../keywords/Bg_step3_operation_plan.robot
Resource    ../keywords/Bg_step4_project_readiness.robot
Resource    ../keywords/Bg_step5_project_status.robot
Resource    ../keywords/VerifySave.robot
Library     SeleniumLibrary
Suite Setup       Open Browser To Application
Suite Teardown    Close Browser

*** Keywords ***
กรอกข้อมูลแบบคำขอตามประเภทและการบันทึก
    [Arguments]    ${expense_type}    ${action}    # action: draft หรือ confirm
    กรอกข้อมูลเข้าสู่ระบบ   ${ORGPROV_USERNAME}    ${ORGPROV_PASSWORD}
    ล็อคอินถูกต้อง
    เข้าเมนูข้อมูลแบบคำขอ

    FOR    ${index}    IN RANGE    1
        กดปุ่มเพิ่มข้อมูลแบบคำขอ

        กรอกข้อมูลtab1ส่วนที่1:ข้อมูล
        กรอกข้อมูลtab1ส่วนที่2:ข้อมูลผู้รับผิดชอบ
        กรอกข้อมูลtab1ส่วนที่3:หลักการและเหตุผล
        กรอกข้อมูลtab1ส่วนที่4:สรุปสาระสำคัญ
        กดปุ่มถัดไปเพื่อบันทึกข้อมูลtab1

        กรอกข้อมูลtab2ส่วนที่1:ข้อมูลทั่วไปของโครงการ
        กรอกข้อมูลtab2ส่วนที่2:สถานที่ดำเนินโครงการ
        กรอกข้อมูลtab2ส่วนที่3:กลุ่มเป้าหมายและผู้มีส่วนได้ส่วนเสีย
        กรอกข้อมูลtab2ส่วนที่4:เป้าหมาย ผลลัพท์ และผลกระทบโครงการ
        กดปุ่มถัดไปเพื่อบันทึกข้อมูลTab2

        FOR    ${index}    IN RANGE    1
            เพิ่มtab3ข้อมูลแนวทางการดำเนินงาน
            เพิ่มชื่อกิจกรรมย่อยและวันที่เริ่ม-สิ้นสุด
            FOR    ${index}    IN RANGE    1
                ${budgetType}    ${paymentGruop}    ${paymentType}    ${amount}   ${explain}    Get Budget Info    ${index}
                เลือกข้อมูลงบประมาณที่ใช้ในกิจกรรมย่อย   ${budgetType}    ${paymentGruop}    ${paymentType}    ${index}
                เพิ่มข้อมูลตามลิสต์ประเภทรายจ่าย
                กดปุ่มเพิ่มข้อมูลงบประมาณ    ${index}    ${amount}    ${explain}
                เพิ่มจำนวนเงินและคำชี้แจง
            END
            กดปุ่มบันทึกข้อมูลกิจกรรมย่อย
        END

        เลือกวิธีการดำเนินการ
        กดปุ่มถัดไปเพื่อบันทึกข้อมูลtab3

        กรอกข้อมูลtab4ส่วนที่1:ข้อมูลทั่วไปของโครงการ
        กรอกข้อมูลtab4ส่วนที่2:ความพร้อมของโครงการ
        กรอกข้อมูลtab4ส่วนที่3:วิธีการบริหารจัดการเมื่อโครงการแล้วเสร็จ
        กดปุ่มถัดไปเพื่อบันทึกข้อมูลtab4

        Run Keyword If    '${expense_type}' == 'รายจ่ายประจำ'    กรอกข้อมูลส่วนที่ 5 ประเภทรายจ่ายประจำ
        ...    ELSE IF    '${expense_type}' == 'รายจ่ายลงทุน'    กรอกข้อมูลส่วนที่ 5 ประเภทรายจ่ายลงทุน

        Run Keyword If    '${action}' == 'draft'    กดปุ่มบันทึกข้อมูลสถานะบันทึกร่าง
        ...    ELSE IF    '${action}' == 'confirm'    กดปุ่มยืนยันข้อมูล

    END
    Verify Save Success

*** Test Cases ***

TC001 : ส่วนราชการบันทึกข้อมูลแบบคำขอ ประเภทรายจ่ายประจำ - บันทึกร่าง
    [Documentation]    ทดสอบกรอกข้อมูลคำขอ รายจ่ายประจำ และกดบันทึกร่าง
    กรอกข้อมูลแบบคำขอตามประเภทและการบันทึก    รายจ่ายประจำ    draft

TC002 : ส่วนราชการบันทึกข้อมูลแบบคำขอ ประเภทรายจ่ายลงทุน - บันทึกร่าง
    [Documentation]    ทดสอบกรอกข้อมูลคำขอ รายจ่ายลงทุน และกดบันทึกร่าง
    กรอกข้อมูลแบบคำขอตามประเภทและการบันทึก    รายจ่ายลงทุน    draft

TC003 : ส่วนราชการบันทึกข้อมูลแบบคำขอ ประเภทรายจ่ายประจำ - ยืนยันข้อมูล
    [Documentation]    ทดสอบกรอกข้อมูลคำขอ รายจ่ายประจำ และกดยืนยันข้อมูล
    กรอกข้อมูลแบบคำขอตามประเภทและการบันทึก    รายจ่ายประจำ    confirm

TC004 : ส่วนราชการบันทึกข้อมูลแบบคำขอ ประเภทรายจ่ายลงทุน - ยืนยันข้อมูล
    [Documentation]    ทดสอบกรอกข้อมูลคำขอ รายจ่ายลงทุน และกดยืนยันข้อมูล
    กรอกข้อมูลแบบคำขอตามประเภทและการบันทึก    รายจ่ายลงทุน    confirm
