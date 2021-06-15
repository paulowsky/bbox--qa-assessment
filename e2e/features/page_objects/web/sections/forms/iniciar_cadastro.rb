module Web
  module Sections
    class FormIniciarCadastro < SitePrism::Section
      element :input_nome_completo, '#input-fullName'
      element :input_email, '#input-email'
      element :input_senha, '#input-password'
      element :input_senha_confirm, '#input-confirmPassword'
      element :check_termos, 'div.checkbox-icon i.icon'
      element :btn_cadastrar, 'button.bbox-button.margin-top-big.bg-blue-base'

      def generate_user(erro)
        @user = Factory::Dynamic.user(erro)
      end

      def realizar_cadastro(erro)
        generate_user(erro)
        input_nome_completo.gset @user[:nome_completo]
        input_email.gset @user[:email]
        input_senha.gset @user[:senha]
        input_senha_confirm.gset @user[:senha_confirm]
        check_termos.gclick if erro != 'não aceitar termos'
        sleep 1
        btn_cadastrar.gclick
        sleep 1
        @user
      end
    end
  end
end
