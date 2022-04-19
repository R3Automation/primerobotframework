*** Settings ***
Documentation       Aqui estarão presente todas as keywords de testes Web

Resource    ../../config/package.robot

*** Keywords ***
Dado que o cliente esteja na tela de cadastro
    #Verificar o titulo da Tab do navegador
    Title Should Be     Automação com Batista

    #Verificar o titulo do formulário Criar novo usuário
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Novo Usuário!!")]


E preenche os campos com dados válidos
    Input Text               id=user_name        ${NOVO_USUARIO}[nome]
    Input Text               id=user_lastname    ${NOVO_USUARIO}[sobrenome]
    Input Text               id=user_email       ${NOVO_USUARIO}[email]
    Input Text               id=user_address     ${NOVO_USUARIO}[endereço]
    Input Text               id=user_university  ${NOVO_USUARIO}[universidade]
    Input Text               id=user_profile     ${NOVO_USUARIO}[profissão]
    Input Text               id=user_gender      ${NOVO_USUARIO}[sexo]
    Input Text               id=user_age         ${NOVO_USUARIO}[idade]


E preenche os campos do cadastro exceto o email
    Input Text               id=user_name        ${NOVO_USUARIO}[nome]
    Input Text               id=user_lastname    ${NOVO_USUARIO}[sobrenome]
    Input Text               id=user_address     ${NOVO_USUARIO}[endereço]
    Input Text               id=user_university  ${NOVO_USUARIO}[universidade]
    Input Text               id=user_profile     ${NOVO_USUARIO}[profissão]
    Input Text               id=user_gender      ${NOVO_USUARIO}[sexo]
    Input Text               id=user_age         ${NOVO_USUARIO}[idade]


Quando clicar em Criar 
    Click Element           xpath=//input[@value='Criar']


Então deve ser apresentada a Mensagem "${MENSAGEM}"
    Wait Until Element Is Visible       xpath=//*[contains(text(), "${MENSAGEM}")]

