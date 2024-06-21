*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${inventory_product_name}    css=div.inventory_details_name.large_size
${inventory_product_price}    css=div.inventory_details_price
${btn_add_to_cart}    css=button.btn.btn_primary.btn_small.btn.btn_inventory

*** Keywords ***
Clicar no botao "Add do cart"
    Click Button    ${btn_add_to_cart}