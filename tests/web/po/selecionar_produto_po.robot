*** Settings ***
Resource    ../../../pages/base_page.robot

*** Test Cases ***
Selecionar Sauce Labs Backpak
    Tirar Screenshot    1_Home
    Preencher usuario    standard_user
    Preencher senha    secret_sauce
    Tirar Screenshot    2_Login Preenchido
    Clicar no botao login
    Element Text Should Be    ${titulo_secao}    Products
    Tirar Screenshot    3_Lista de produtos
    Clicar no produto    Sauce Labs Backpack
    Element Text Should Be    ${inventory_product_name}    Sauce Labs Backpack
    Element Text Should Be    ${inventory_product_price}    $29.99
    Tirar Screenshot    4_Detalhes do Produto
    Clicar no botao "Add do cart"
    Clicar no carrinho
    Element Text Should Be    ${titulo_secao}    Your Cart
    Element Text Should Be    ${cart_product_name}    Sauce Labs Backpack
    Element Text Should Be    ${cart_product_price}    $29.99
    Element Text Should Be    ${cart_product_quantity}    1
    Tirar Screenshot    5_Carrinho
    Realizar Logout
