*** Settings ***
Documentation      Aqui estarão presente todas as Keywords dos testes da funcionalidade de login 
...                do site automationpratice.com


##########################
#         Config         #
##########################
Resource    ../../src/config/package.robot


*** Keywords ***
Dado que o cliente tenha um cadastro


Quando informar suas credenciais de acesso


Então o login será realizado com sucesso
