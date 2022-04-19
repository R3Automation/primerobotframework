*** Settings ***
Documentation       Aqui estarão presentes todos os arquivos para inicializaçãoe finalização de testes

##########################
#        Keywords        #
##########################
Resource    ../auto/keywords/kws_web.robot

##########################
#         Config         #
##########################
Resource        package.robot


*** Keywords ***
Abrir navegador
    Open Browser        about:blank     chrome

    #Ir para a pagina de criação de usuário
    Go To               https://automacaocombatista.herokuapp.com/users/new

    #Maximizar a tela do navegador
    Maximize Browser Window


Fechar navegador
    #Pós Teste Finalizado
    Close Browser


Abrir navegador Automation Practice
    
    Set Selenium Implicit Wait          ${CONFIG.IMPLICITY_WAIT}
    Open Browser        about:blank     ${CONFIG.BROWSER_NAME}

    #Ir para a pagina de criação de usuário
    Go To               ${CONFIG.URL}

    #Maximizar a tela do navegador
    Maximize Browser Window


Fechar navegador Automation Practice
    #Pós Teste Finalizado
    Close Browser

