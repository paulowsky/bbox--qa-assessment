#language: pt

@cadastro
Funcionalidade: Cadastro

  @realizar_pre_cadastro
  Cenário: Realizar pré cadastro
    Dado que esteja na página de cadastro
    Quando realizar cadastro com usuário válido
    Então deverá ser exibido o form de finalização de cadastro do usuário correto

  @realizar_pre_cadastro_exception
  Esquema do Cenário: Realizar pré cadastro Exception
    Dado que esteja na página de cadastro
    Quando realizar cadastro com erro '<erro>'
    Então deverá ser exibida a mensagem de erro '<mensagem>'

    Exemplos:
      | erro                           | mensagem                                                                        |
      | não aceitar termos             | É necessário aceitar os termos de uso e política de privacidade para prosseguir |
      | email inválido                 | E-mail e/ou senha inválidos                                                     |
      | email já registrado            | E-mail já cadastrado!                                                           |
      | email em branco                | Lembre-se de preencher os campos                                                |
      | senha curta                    | A senha deve ter pelo menos 8 caracteres                                        |
      | senha em branco                | Lembre-se de preencher os campos                                                |
      | confirmação de senha em branco | Lembre-se de preencher os campos                                                |
      | nome em branco                 | Lembre-se de preencher os campos                                                |
      | senhas não correspondem        | As senhas não correspondem                                                      |
