#language :pt

@api
@users
Funcionalidade: App Bossabox Users

  @users_register
  # POST -> /users
  Esquema do Cenário: Validar consentimentos do cliente
    Dado que possua os dados '<dados>' do tipo '<tipo>' para o cenário '<cenario>' do serviço '<servico>'
    E que possua os campos '<unicos>' únicos
    Quando fazer uma requisição
    Então deverá receber a response status '<status>'
    E deverá retornar os dados corretos para o cenário register do serviço users status '<status>'

    Exemplos:
      | servico | cenario  | dados              | unicos         | tipo   | status |
      | users   | register | valido             | email,fullName | static | 200    |
      | users   | register | email-registrado   | fullName       | static | 400    |
      | users   | register | email-invalido     | fullName       | static | 400    |
      | users   | register | fullName-branco    | email          | static | 400    |
      | users   | register | loginType-invalido | email          | static | 500    |
