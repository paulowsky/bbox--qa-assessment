module Web
  module Pages
    class FinalizarCadastro < SitePrism::Page
      set_url '/profile/finish-registration'

      element :span_hello_user_name, 'div h2'

      def hello_user_name
        span_hello_user_name.text
      end
    end
  end
end
