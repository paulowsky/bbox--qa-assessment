Dir[File.join(File.dirname(__FILE__), 'page_objects/web/pages/*.rb')]
  .sort.each { |file| require file }

module Web
  module Pages
    class WebPages
      class << self
        def login
          Web::Pages::Login.new
        end

        def iniciar_cadastro
          Web::Pages::IniciarCadastro.new
        end

        def finalizar_cadastro
          Web::Pages::FinalizarCadastro.new
        end
      end
    end
  end
end
