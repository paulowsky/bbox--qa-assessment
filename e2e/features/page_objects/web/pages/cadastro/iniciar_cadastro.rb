require_relative '../../sections/forms/iniciar_cadastro'

module Web
  module Pages
    class IniciarCadastro < SitePrism::Page
      set_url '/signup'

      element :span_error, 'div p'

      section :form_cadastro, Web::Sections::FormIniciarCadastro, 'div[class="padding-big"]'

      def realizar_cadastro(erro=nil)
        form_cadastro.realizar_cadastro(erro)
      end

      def error
        span_error.text
      end
    end
  end
end
