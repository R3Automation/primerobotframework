*** Settings ***
Documentation       Aqui estarão presente todos os testes automatizados da funcionalidade de login
##########################
#         Config         #
##########################
Resource    ../../src/config/package.robot


Test Setup      Abrir navegador Automation Practice
Test Teardown   Fechar navegador Automation Practice


*** Test Cases ***
Cenario: Login com sucesso
    Dado que o cliente tenha um cadastro
    Quando informar suas credenciais de acesso
    Então o login será realizado com sucesso
