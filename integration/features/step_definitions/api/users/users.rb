Dado('que possua os dados {string} do tipo {string} para o cenário {string} do serviço {string}') do |dados, type, cenario, servico|
  @tipo_dados = dados
  dados = {:data => dados, :type => type}
  @servico = servico
  @cenario = cenario
  @dados = load_data(dados, servico, cenario)
  @headers = {}
end

Dado('que possua os headers:') do |headers|
  @headers = headers.rows_hash
end

Quando('que possua os campos {string} únicos') do |unicos|
  @dados = inject_data(@dados, unicos)
end

Quando('fazer uma requisição') do
  puts @utils.show_request(@dados)
  @service = $services.send(@servico.downcase)
  @service.set_headers(@headers)
  @response = @service.send(@cenario.downcase, @dados)
end

Então('deverá receber a response status {string}') do |status|
  puts @utils.show_response(@response)
  expect(@response.code).to eql status.to_i
  expect(@utils.validate_schema(@servico, @cenario, status, @response)).to be true
end

Então('deverá retornar os dados corretos para o cenário register do serviço users status {string}') do |status|
  case status
  when '200'
    expect(@response['user']['email']).to eql @dados['email']
    expect(@response['user']['fullName']).to eql @dados['fullName']
    expect(@response['user']['loginType'][0]).to eql @dados['loginType']
  when '400'
    case @tipo_dados
    when 'email-registrado'
      expect(@response['error']['code']).to eql 'EMAIL_REGISTERED'
      expect(@response['error']['message']).to eql 'E-mail já cadastrado'
    when 'email-invalido'
      expect(@response['error']['code']).to eql 'INVALID_EMAIL'
      expect(@response['error']['message']).to eql 'O e-mail é inválido'
    when 'fullName-branco'
      expect(@response['error']['code']).to eql 'FULLNAME_REQUIRED'
      expect(@response['error']['message']).to eql '"fullName" é obrigatório'
    else
      raise 'ERROR: datatype not supported!'
    end
  when '500'
    case @tipo_dados
    when 'loginType-invalido'
      expect(@response['error']['code']).to eql 'INTERNAL_SERVER_ERROR'
      expect(@response['error']['message']).to eql 'Request failed with status code 500'
    else
      raise 'ERROR: datatype not supported!'
    end
  else
    raise 'ERROR: status not supported!'
  end
end
