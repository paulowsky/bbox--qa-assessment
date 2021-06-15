Dado('que esteja na página de cadastro') do
  step 'que esteja na página de login'
  @login.acessar_cadastro
  @iniciar_cadastro = $pages.iniciar_cadastro
end

Quando('realizar cadastro com usuário válido') do
  @user_cadastro = @iniciar_cadastro.realizar_cadastro
end

Quando('realizar cadastro com erro {string}') do |erro|
  @user_cadastro = @iniciar_cadastro.realizar_cadastro(erro)
end

Então('deverá ser exibido o form de finalização de cadastro do usuário correto') do
  @finalizar_cadastro = $pages.finalizar_cadastro
  expect(@finalizar_cadastro.hello_user_name).to eql "Olá, #{@user_cadastro[:primeiro_nome]}"
end

Então('deverá ser exibida a mensagem de erro {string}') do |mensagem|
  expect(@iniciar_cadastro.error).to eql mensagem
end
