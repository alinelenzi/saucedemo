#Ações comuns entre as páginas
*** Settings ***
Library    SeleniumLibrary
Library    DateTime

Resource    cart_page.robot
Resource    inventory_item_page.robot
Resource    inventory_page.robot
Resource    login_page.robot

*** Variables ***
${timeout}    10000ms
${url}    https://www.saucedemo.com/
${browser}    Chrome
${date}

*** Keywords ***
Abrir navegador
    Register Keyword To Run On Failure    Tirar Screenshot
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    8000ms
    Wait Until Element Is Visible    css=.login_logo    ${timeout}
Fechar navegador
    Sleep    500ms    #pode ser necessário para dar tempo de realizar a última ação/validação
    Close Browser
Clicar no carrinho
    Click Element    css=[data-test="shopping-cart-link"]
    Wait Until Element Contains    css=[data-test="title"]    Your Cart    ${timeout}
Realizar Logout
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link
    Click Link    id=logout_sidebar_link
    Wait Until Element Is Not Visible    css=.login-logo    ${timeout}
Obter Data e Hora
    ${date} =    Get Current Date    #Ler data e hora do Sistema Operacional
    ${date} =    Convert Date    ${date}    result_format=%Y.%m.%d_%H.%M.%S
    ${date}    Set Global Variable    ${date}
Tirar Screenshot
    [Arguments]    ${screenshot_name}
    Capture Page Screenshot    screenshots/saucedemo/${date}/${TEST_NAME}/${screenshot_name}.jpg


