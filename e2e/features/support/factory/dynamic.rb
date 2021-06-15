require 'brazilian_documents'
require 'cpf_faker'
require 'faker'

module Factory
  class Dynamic
    def self.with_error(data, error)
      case error
      when 'email inválido'
        data[:email] = 'mail.com'
      when 'email já registrado'
        data[:email] = 'mail@mail.com'
      when 'email em branco'
        data[:email] = ''
      when 'senha curta'
        data[:senha] = '123'
      when 'senha em branco'
        data[:senha] = ''
      when 'confirmação de senha em branco'
        data[:senha_confirm] = ''
      when 'nome em branco'
        data[:nome_completo] = ''
      when 'senhas não correspondem'
        data[:senha_confirm] = '123'
      end
      data
    end

    def self.user(error = nil)
      user = {
        :primeiro_nome => "Test",
        :nome_completo => "Test Automation #{Faker::Name.first_name}",
        :email => "teste.#{Faker::Name.first_name}.#{rand(9999)}@mailsac.com",
        :senha => 'senha123',
        :senha_confirm => 'senha123'
      }

      user = Dynamic.with_error(user, error) if error

      user
    end
  end
end
