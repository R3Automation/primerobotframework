*** Settings ***
Documentation       Este sera o nosso gerenciador de dependĂȘncias

Library     SeleniumLibrary
Library     FakerLibrary
Library     DebugLibrary


##########################
#        Keywords        #
##########################
Resource    ../auto/keywords/kws_web.robot
Resource    ../auto/keywords/kws_automation_web.robot
Resource    ../auto/keywords/kws_login.robot

##########################
#          Pages         #
##########################
Resource    ../auto/pages/page_cadastro.robot

##########################
#         Config         #
##########################
Resource    hooks.robot
Variables   hooks.yaml
Variables   ../auto/data/register.yaml