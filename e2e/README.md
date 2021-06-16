# integration

## Overview
O código utiliza Design Patterns e estruturações avançadas, visando manutenção e reaproveitamento em grande escala.\
- Uso de Gherkin (features/steps)
- Uso de Page Objects Model
- Massas de dados centralizadas com estrutura de controle (Factory)
- Configuração multi ambiente (massas de dados dinâmicos)
- Configuração multi pages (spec_helper - possibilidade de adição de outras camadas reutilizando os mesmos steps)
- Execução paralelizada

## Requisitos
- Ruby 2.5.x
- [chromedriver]('https://chromedriver.chromium.org/downloads') da mesma versão do chrome\
-- Baixar e extrair em uma pasta que esteja no path (ex: pasta bin do ruby)

## Execução
### Local
1. Acesso: acessar a raiz do projeto usando um terminal
2. Instalação de dependências: executar o comando `bundle install`
3. Execução dos testes serial: executar o comando `bundle exec cucumber`
4. Execução dos testes paralela: executar o comando `bundle exec cucumber -p parallel`
5. Execução de um cenário específico: executar o comando `bundle exec cucumber -t @tag_desejada` (encontrar tags nos cenários dos arquivos .feature)

## Cenários validados
Felizes:
- Cadastro de usuário válido

Tristes:
- Cadastro sem aceitar termos
- Cadastro de usuário com e-mail já registrado
- Cadastro de usuário com e-mail inválido
- Cadastro de usuário com nome em branco
- Cadastro de usuário com senha em branco
- Cadastro de usuário com senha curta
- Cadastro de usuário com confirmação de senha em branco
- Cadastro de usuário com as senhas não correspondentes

## Métricas
Reports HTML/JSON foram configurados e serão gerados na pasta reports (quando executado localmente).

## Extras
Foi adicionada uma configuração para execução dos testes em paralelo (para quando o projeto cresce e existem muitos cenários), assim mantendo o tempo de execução regressiva baixo.
