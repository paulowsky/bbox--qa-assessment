module Web
  module Pages
    class Login < SitePrism::Page
      set_url '/login'

      element :btn_acessar_cadastro, 'div.margin-top-big button'

      def acessar_cadastro
        btn_acessar_cadastro.gclick
      end
    end
  end
end
