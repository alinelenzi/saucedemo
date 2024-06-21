*** Settings ***
Resource    ../../../pages/base_page.robot
Test Template   Selecionar Sauce Labs Backpak

*** Test Cases ***

TC001    Sauce Labs Backpack    $29.99
TC002    Sauce Labs Bike Light    $9.99
TC003    Sauce Labs Bolt T-Shirt    $15.99
TC004    Sauce Labs Fleece Jacket    $49.99
TC005    Sauce Labs Onesie    $7.99
TC006    Test.allTheThings() T-Shirt (Red)    $15.99

*** Keywords ***
Selecionar Sauce Labs Backpak
    [Arguments]    ${product_name}    ${product_price}
    Tirar Screenshot    1_Home
    Preencher usuario    standard_user
    Preencher senha    secret_sauce
    Tirar Screenshot    2_Login Preenchido
    Clicar no botao login
    Element Text Should Be    ${titulo_secao}    Products
    Tirar Screenshot    3_Lista de produtos
    Clicar no produto    ${product_name}
    Element Text Should Be    ${inventory_product_name}    ${product_name}
    Element Text Should Be    ${inventory_product_price}    ${product_price}
    Tirar Screenshot    4_Detalhes do Produto
    Clicar no botao "Add do cart"
    Clicar no carrinho
    Element Text Should Be    ${titulo_secao}    Your Cart
    Element Text Should Be    ${cart_product_name}    ${product_name}
    Element Text Should Be    ${cart_product_price}    ${product_price}
    Element Text Should Be    ${cart_product_quantity}    1
    Tirar Screenshot    5_Carrinho
    Realizar Logout