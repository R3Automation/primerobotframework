*** Settings ***
Documentation       Aqui estarão presente todas as variaveis de testes do sistema web Automation Practice

Resource    ../../config/package.robot


*** Variable ***
@{LISTA_PRODUTOS}
...         Blouse
...         Cachecol

${EMAIL_VALIDO}     teste3@msn.com

&{DADOS_USUARIO}
...             nome=Raphael
...             sobrenome=Reis
...             senha=Teste123*
...             aniversariodia=31
...             aniversariomes=December
...             aniversarioano=1987
...             sexo=Mr.
...             newsletter=Yes
...             special_offers=Yes
...             company=Prime Control
...             address=1717 Harrison St
...             city=San Francisco
...             state=California
...             postal_code=94103
...             country=United States
...             additional_information=usuário de testes
...             home_phone=551122229999
...             mobile_phone=5511922229999
...             address_alternative=2717 Harrison St