*** Settings ***
Documentation       Aqui estarão presente todos os testes automatizados do sistema web Automation Practice

##########################
#         Config         #
##########################
Resource    ../../src/config/package.robot


Test Setup      Abrir navegador Automation Practice
Test Teardown   Fechar navegador Automation Practice


*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    [Tags]               Pesquisa_OK

    Dado que o cliente esteja no site Automation Practice
    E preenche no campo de pesquisa o produto Blouse
    Quando clicar no botão pesquisar
    Então conferir se o produto foi listado no site
    
Caso de Teste 02: Pesquisar produto não existente
    [Tags]               Pesquisa_NOK
    
    Dado que o cliente esteja no site Automation Practice
    E preenche no campo de pesquisa o produto não existente
    Quando clicar no botão pesquisar
    Então deve ser apresentada a mensagem de erro "No results were found for your search"
    

Caso de Teste 03: Listar Produtos
    [Tags]               Listar_Produtos
        
    Dado que o cliente esteja no site Automation Practice
    E ao passar o mouse sobre a categoria WOMEN do menu principal
    Quando clicar no submenu SUMMER DRESSES
    Então conferir se os produtos Summer Dresses estão sendo exibidos


Caso de Teste 04: Adicionar cliente
    [Tags]               Cad_user
        
    Dado que o cliente esteja no site Automation Practice
    E clicar em SIGN IN
    E preenche o campo E-mail com dados válidos
    E clicar em CREATE AN ACCOUNT
    E preenche os campos do cadastro com dados válidos
    Quando submeter o cadastro ao clicar no botão REGISTER
    Então conferir se o cadastro foi efetuado