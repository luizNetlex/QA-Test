*** Settings ***

Documentation  Testes na area de cadastro e login

Library  SeleniumLibrary


*** Variables ***



*** Test Cases ***
Usuários não cadastrados devem ser capazes de realizar cadastro no sistema;
    [Documentation]  O Usuário deve inserir as informações e, se corretas, o sistema cria sua conta.
    [Tags]  Smoke
    Open Browser  https://letsbomfin.github.io/cadastro.github.io/  googlechrome
    wait until page contains  Seu nome
    input text  id=nome_cad  Luiz Cunha
    input text  id=email_cad  cluizfilipe@gmail.com
    input text  id=estado_cad  minas gerais
    input text  id=cidade_cad  sabará
    input text  id=rua_cad  rua um
    input text  id=bairro_cad  pompéu
    input text  name=cep  34518
    input text  name=cep2  090
    input password  id=senha_cad  ftfA$1
    click button  xpath=//*[@id="cadastro"]/form/p[9]/input
    wait until page does not contain element  id=nome_cad
    [Teardown]    Close Browser


*** Keywords ***


