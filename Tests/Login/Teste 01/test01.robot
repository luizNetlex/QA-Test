*** Settings ***

Documentation  Testes na area de cadastro e login

Library  SeleniumLibrary


*** Variables ***

${email}  luiz.cunha@netlex.com.br
${senha}  A@1abcd

${present}



*** Test Cases ***
Usuários cadastrados devem ser capazes de realizar Login no sistema
    [Documentation]  Usuário preenche o cadastro com as informações corretas. Se o cadastro não for realizado, ele loga no sistema
    [Tags]  Smoke
    Open Browser  https://letsbomfin.github.io/cadastro.github.io/  googlechrome
    wait until page contains  Seu nome
    input text  id=nome_cad  Luiz Cunha
    input text  id=email_cad  ${email}
    input text  id=estado_cad  minas gerais
    input text  id=cidade_cad  sabará
    input text  id=rua_cad  rua um
    input text  id=bairro_cad  pompéu
    input text  name=cep  34518
    input text  name=cep2  090
    input password  id=senha_cad  ${senha}
    click button  xpath=//*[@id="cadastro"]/form/p[9]/input
    ${present}=  Run Keyword And Return Status    page should contain element   id=nome_cad
    run keyword if  ${present}=='True'    run keyword  Exec Login
    wait until page does not contain element  id=nome_login

    [Teardown]  close browser


*** Keywords ***
Exec Login
    click element  css=#cadastro > form > p.link > a
    input text  id=nome_login  ${email}
    input password  id=email_login  ${senha}
    click button  xpath=//*[@id="login"]/form/p[4]/input