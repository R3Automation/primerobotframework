*** Settings ***
Documentation       Aqui estará presente todos os testes iniciais do curso de Robot Framework Básico

*** Variable ***

&{PESSOA}
...     nome=Raphael
...     sobrenome=Reis
...     idade=34
...     cpf=01234567890
...     rg=01234567890

@{FRUTAS}
...     Abacate
...     Abacaxi
...     Morango
...     Banana
...     Melancia


*** Test Cases ***
Cenário 1: Imprimir dicionario no console
    [tags]  	Dicionário

    Log To Console      ${PESSOA.nome}
    Log To Console      ${PESSOA.sobrenome}
    Log To Console      ${PESSOA.idade}
    Log To Console      ${PESSOA.cpf}
    Log To Console      ${PESSOA.rg}


Cenário 2: Imprimir lista no console
    [tags]  	Lista

    Log To Console      ${FRUTAS}[0]
    Log To Console      ${FRUTAS}[1]
    Log To Console      ${FRUTAS}[2]
    Log To Console      ${FRUTAS}[3]
    Log To Console      ${FRUTAS}[4]


Cenário 3: Soma de dois valores
    [tags]  	Somar
    
    Somar dois numeros     100    50


Cenário 4: Desafio e-mail
    [tags]  	Email

    Criar um e-mail     Raphael        reis      34


Cenário 5: Contar de 0 a 9
    [tags]  	Contar

    Contar de 0 a 9
    Percorrer a lista de frutas


Cenário 6: Lição de casa 1
    [tags]  	Lição_casa_1
    
    Contar de 0 a 10 e imprimir frase


Cenário 7: Lição de casa 2
    [tags]  	Lição_casa_2
    
    Contar de 0 a 10 e imprimir frase qunado 5 ou 8


Cenário 8: Estudando condição (IF)
    [tags]  	Condição

    Tomar decisões      Raphael

*** Keywords ***
# Argumento Embutido
Somar dois numeros
    [Arguments]     ${NUM_A}    ${NUM_B}
    ${SOMA}     Evaluate        ${NUM_A}+${NUM_B}
    Log To Console      ${SOMA}
    [Return]            ${SOMA}


Criar um e-mail
    [Arguments]     ${NOME}    ${SOBRENOME}     ${IDADE}
    ${EMAIL}        Catenate        SEPARATOR=_     ${NOME}    ${SOBRENOME}     ${IDADE}@robot.com
    Log To Console      ${EMAIL}
    [Return]            ${EMAIL}


Contar de 0 a 9
    FOR     ${contador}     IN RANGE    0   9
        Log To Console    ${contador}
    END


Percorrer a lista de frutas
    FOR     ${FRUTA}     IN     @{FRUTAS}
        Log To Console    ${fruta}
    END

Contar de 0 a 10 e imprimir frase
    FOR     ${contador}     IN RANGE    0   11
        Log To Console      Estou no número:${contador}
        
    END


Contar de 0 a 10 e imprimir frase qunado 5 ou 8
    FOR     ${contador}     IN RANGE    0   11
        IF          "${contador}"=="5"
                    Log To Console      Estou no número:${contador}
        ELSE IF     "${contador}"=="8"
                    Log To Console      Estou no número:${contador}
        END 
        
    END


Tomar decisões
    [Arguments]     ${NOME}

    IF      "${NOME}"=="Maria"
            Log To Console      Vou fazer isso quando for Maria!
    ELSE IF  "${NOME}"=="João"
            Log To Console      Vou fazer isso quando for João!
    ELSE
            Log To Console      Vou fazer isso quando for qualquer outra pessoa!
    END