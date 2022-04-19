*** Settings ***
Documentation       Aqui estarão presente todas as keywords de testes do sistema web Automation Practice

Resource    ../../config/package.robot


*** Keywords ***
Dado que o cliente esteja no site Automation Practice
    #Verificar o titulo da Tab do navegador
    Title Should Be     My Store

    #Verificar um elemento unico da tela home
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Best Sellers")]


E preenche no campo de pesquisa o produto Blouse
    #Preenche o produto no campo Search
    Input Text               id=search_query_top        ${LISTA_PRODUTOS}[0]


E preenche no campo de pesquisa o produto não existente
    #Preenche o produto no campo Search
    Input Text               id=search_query_top        ${LISTA_PRODUTOS}[1]


E ao passar o mouse sobre a categoria WOMEN do menu principal
    #Passa o mouse sobre o menu WOMEN
    Mouse Over          xpath=//a[contains(@title, "Women")]

E clicar em SIGN IN
    #Clica no menu SIGN IN
    Click Element       xpath=//*[contains(text(), "Sign in")]


E preenche o campo E-mail com dados válidos
    ${FAKE_EMAIL}           FakerLibrary.Free Email

    #Verificar se esta na tela de Login/Cadastro de usuario
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Create an account")]
    #Preenche o produto no campo Search
    Input Text               id=email_create        ${FAKE_EMAIL}


E clicar em CREATE AN ACCOUNT
    #Clica no botão CREATE AN ACCOUNT
    Click Button           xpath=//*[contains(@id, "SubmitCreate")]
    

E preenche os campos do cadastro com dados válidos
    ${FAKE_NAME}           FakerLibrary.Name
    ${FAKE_LASTNAME}       FakerLibrary.Last Name
    ${FAKE_ADRESS}         FakerLibrary.Street Address
    ${FAKE_COMPANY}        FakerLibrary.Company    
    ${FAKE_CITY}           FakerLibrary.City
    ${FAKE_STATE}          FakerLibrary.State
    ${FAKE_POSTCODE}       FakerLibrary.Postcode
    ${FAKE_ALIAS}          FakerLibrary.User Name
    Set Suite Variable     ${FAKE_NAME}

    # Sessão YOUR PERSONAL INFORMATION
        #Verificar se esta exibindo em tela a Sessão YOUR PERSONAL INFORMATION
        Wait Until Element Is Visible    xpath=//*[contains(text(), "Your personal information")]
    
        #Seleciona o sexo do usuário    
        IF          "${DADOS_USUARIO}[sexo]"=="Mr."
                    Click Element       xpath=//input[contains(@id, "id_gender1")]
        ELSE IF     "${DADOS_USUARIO}[sexo]"=="Mrs."
                    Click Element       xpath=//input[contains(@id, "id_gender2")]
        END

        #Preenche os campos nome, sobrenome e password da Sessão YOUR PERSONAL INFORMATION
        Input Text               id=customer_firstname      ${FAKE_NAME}
        Input Text               id=customer_lastname       ${FAKE_LASTNAME}
        Input Text               id=passwd                  ${CADASTRO.SENHA}

#        Input Text               id=customer_firstname      ${DADOS_USUARIO}[nome]
#        Input Text               id=customer_lastname       ${DADOS_USUARIO}[sobrenome]
#        Input Text               id=passwd                  ${DADOS_USUARIO}[senha]

        #Preenche os dados da data de nascimento
            #Preenche o dia de nascimento
            Click Element       xpath=//*[contains(@name, "days")]
            click Element       xpath=//option[contains(text(),'${CADASTRO.DIA}')]
    
            #Preenche o mes de nascimento
            Click Element       xpath=//*[contains(@name, "months")]
            click Element       xpath=//option[contains(text(),'${CADASTRO.MES}')]

            #Preenche o ano de nascimento
            Click Element       xpath=//*[contains(@name, "years")]
            click Element       xpath=//option[contains(text(),'${CADASTRO.ANO}')]
    

#            Click Element       xpath=//*[contains(@name, "days")]
#            click Element       xpath=//option[contains(text(),'${DADOS_USUARIO}[aniversariodia]')]
#    
#            #Preenche o mes de nascimento
#            Click Element       xpath=//*[contains(@name, "months")]
#            click Element       xpath=//option[contains(text(),'${DADOS_USUARIO}[aniversariomes]')]
#
#            #Preenche o ano de nascimento
#            Click Element       xpath=//*[contains(@name, "years")]
#            click Element       xpath=//option[contains(text(),'${DADOS_USUARIO}[aniversarioano]')]

        #Seleciona checkbox de newsletter
        IF          "${DADOS_USUARIO}[newsletter]"=="Yes"
                    Click Element       xpath=//*[contains(text(), "Sign up for our newsletter!")]
        END

        #Seleciona checkbox de Receive special offers from our partners!
        IF          "${DADOS_USUARIO}[special_offers]"=="Yes"
                    Click Element       xpath=//*[contains(text(), "Receive special offers from our partners!")]
        END

    # Sessão YOUR YOUR ADDRESS
        #Verificar se esta exibindo em tela a Sessão YOUR ADDRESS
        Wait Until Element Is Visible    xpath=//*[contains(text(), "Your address")]
      
        #Preenche os campos [nome, sobrenome, Company, Endereço e Cidade] da Sessão YOUR ADDRESS
        #Input Text               id=firstname      ${DADOS_USUARIO}[nome]
        #Input Text               id=lastname       ${DADOS_USUARIO}[sobrenome]
        Input Text               id=company        ${CADASTRO.COMPANY}
        Input Text               id=address1       ${CADASTRO.ADDRESS}
        Input Text               id=city           ${FAKE_CITY}

#        Input Text               id=firstname      ${DADOS_USUARIO}[nome]
#        Input Text               id=lastname       ${DADOS_USUARIO}[sobrenome]
#        Input Text               id=company        ${DADOS_USUARIO}[company]
#        Input Text               id=address1       ${DADOS_USUARIO}[address]
#        Input Text               id=city           ${DADOS_USUARIO}[city]

        #Seleciona o estado do usuário
            Click Element       id=uniform-id_state
            #click Element       xpath=//option[contains(text(),'${DADOS_USUARIO}[state]')]
            Select From List By Value         id=id_state         3
            #click Element       xpath=//option[contains(text(),'${FAKE_STATE}')]

        #Preenche o campo [ZIP/Postal Code] da Sessão YOUR ADDRESS
#        Input Text               id=postcode       ${DADOS_USUARIO}[postal_code]
        Input Text               id=postcode       ${FAKE_POSTCODE}

        #Seleciona o Pais do usuário
            Click Element       id=id_country
            click Element       xpath=//option[contains(text(), '${DADOS_USUARIO}[country]')]

        #Preenche os campos [Informações Adicionais, Telefone, Celular e Endereço Alternativo] da Sessão YOUR ADDRESS
        Input Text               id=other          ${DADOS_USUARIO}[additional_information]
        Input Text               id=phone          ${DADOS_USUARIO}[home_phone]
        Input Text               id=phone_mobile   ${DADOS_USUARIO}[mobile_phone]
        Input Text               id=alias          ${FAKE_ALIAS}


#        Input Text               id=other          ${DADOS_USUARIO}[additional_information]
#        Input Text               id=phone          ${DADOS_USUARIO}[home_phone]
#        Input Text               id=phone_mobile   ${DADOS_USUARIO}[mobile_phone]
#        Input Text               id=alias          ${DADOS_USUARIO}[address_alternative]

Quando clicar no botão pesquisar
    #Clica no botão Lupa (Pesquisar) do campo Search
    Click Button           xpath=//*[@id="searchbox"]/button


Quando clicar no submenu SUMMER DRESSES
    #Verificar se esta exibindo na tela o titulo de Subcategorias
    Wait Until Element Is Visible    xpath=//div/ul/li/ul/li/ul/li/a[contains(@title, "Summer Dresses")]
    
    #Clica botão categoria DRESSES
    Click Element       xpath=//div/ul/li/ul/li/ul/li/a[contains(@title, "Summer Dresses")]
    

Quando submeter o cadastro ao clicar no botão REGISTER
    #Clica no botão REGISTER da tela de cadastro de usuários
    Click Element           xpath=//*[contains(@name, "submitAccount")]
    #//*[contains(@name, "submitAccount")]


Então conferir se o produto foi listado no site
    #Verificar o titulo da Tab do navegador
    Title Should Be     Search - My Store

    #Verificar o titulo do produto
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/ul/li/div/div[2]/h5/a


Então deve ser apresentada a mensagem de erro "${MENSAGEM}"
    #Verificar mensagem de erro
    Wait Until Element Is Visible       xpath=//*[contains(text(), "${MENSAGEM}")]


Então conferir se os produtos Summer Dresses estão sendo exibidos
    #Verificar o titulo da Tab do navegador
    Title Should Be     Summer Dresses - My Store
    #Verificar banner Summer Dresses
    Wait Until Element Is Visible       xpath=//span[contains(text(), " Summer Dresses ")]
    Capture Page Screenshot
    #Verificar titulo de produtos Summer Dresses
    Wait Until Element Is Visible       xpath=//span[contains(@class, "cat-name")]
    Capture Element Screenshot          xpath=//span[contains(@class, "cat-name")]
    #Verificar qunaidade de produtos exibidos para subcatogeria Summer Dresses
    Wait Until Element Is Visible       xpath=//*[contains(text(), "There are 3 products.")]
    Capture Element Screenshot          xpath=//*[contains(text(), "There are 3 products.")]
    

Então conferir se o cadastro foi efetuado
    #Verificar o titulo da Tab do navegador
    Title Should Be     My account - My Store
    
    #Verificar nome do usuário logado
#    Wait Until Element Is Visible       xpath=//span[contains(text(),'${DADOS_USUARIO}[nome]')]
    Wait Until Element Is Visible       xpath=//span[contains(text(),'${FAKE_NAME}')]
    ##Wait Until Element Is Visible       xpath=//*[contains(text(), "Raphael dos reis")]
    Capture Page Screenshot
    
    #Verificar a exibição do botão 
    Wait Until Element Is Visible       xpath=//a[contains(@title, "Log me out")]
    Capture Page Screenshot

    #Verificar titulo principal da tela
    Wait Until Element Is Visible       xpath=//h1[contains(text(), "My account")]
    Capture Page Screenshot