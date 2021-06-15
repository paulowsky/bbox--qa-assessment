# integration

## Overview
O código utiliza Design Patterns e estruturações avançadas, visando manutenção e reaproveitamento em grande escala.\
- Uso de Gherkin (features/steps)
- Uso de services
- Massas de dados centralizadas com estrutura de controle (Factory)
- Configuração multi versão dos services
- Configuração multi ambiente (massas de dados e endpoints dinâmicos)
- Execução paralelizada
- Validação dos schemas

## Requisitos
- Ruby 2.5.x

## Execução
### Local
1. Acesso: acessar a raiz do projeto usando um terminal
2. Instalação de dependências: executar o comando `bundle install`
3. Execução dos testes serial: executar o comando `cucumber`
4. Execução dos testes paralela: executar o comando `cucumber -p parallel`
5. Execução de um cenário específico: executar o comando `cucumber -t @tag_desejada` (apenas 1 cenário abrangido, então apenas 1 tag: @users_register)

## Cenários validados
- Cadastro de usuário válido (apresenta erro na validação do e-mail retornado)
- Cadastro de usuário com e-mail já registrado
- Cadastro de usuário com e-mail inválido
- Cadastro de usuário com nome em branco
- Cadastro de usuário com loginType inválido

## Falhas
Foi encontrado um problema no cadastro de usuário válido, o qual retorna um e-mail diferente do informado no cadastro (com os caracteres todos em minúsculo).

## Métricas
Reports HTML/JSON foram configurados e serão gerados na pasta reports (quando executado localmente).\
Usando o Jenkins, com o plugin cucumber-reports instalado, os reports serão gerados na aba reports, com métricas e acompanhamento da qualidade geral.

## Extras
Além da configuração para rodar em Continuous Integration com virtualização (Jenkins+Docker), foi adicionada uma configuração para execução dos testes em paralelo (para quando o projeto cresce e existem muitos cenários), assim mantendo o tempo de execução regressiva baixo.
