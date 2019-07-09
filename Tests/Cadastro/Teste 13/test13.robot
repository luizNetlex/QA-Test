*** Settings ***

Documentation  Testes na area de cadastro e login

Library  SeleniumLibrary


*** Variables ***



*** Test Cases ***
O Usuário deve inserir uma senha contendo 1 letra maúscula, 1 caracter especial e 1 numero. Mínimo de 6 caracteres.
    [Documentation]  Usuário insere a senha A@1abc (seguindo as regras especificadas)
    [Tags]  Smoke
    Open Browser  https://letsbomfin.github.io/cadastro.github.io/  googlechrome
    wait until page contains  Seu nome
    input text  id=nome_cad  Luiz Cunha
    input text  id=email_cad  luiz.cunha@netlex.com.br
    input text  id=estado_cad  minas gerais
    input text  id=cidade_cad  sabará
    input text  id=rua_cad  rua um
    input text  id=bairro_cad  pompéu
    input text  name=cep  34518
    input text  name=cep2  090
    input password  id=senha_cad  A@1abc
    click button  xpath=//*[@id="cadastro"]/form/p[9]/input
    Welcome Page Should Be Open
    [Teardown]    Close Browser


*** Keywords ***

Welcome Page Should Be Open
    Title Should Be    Welcome Page