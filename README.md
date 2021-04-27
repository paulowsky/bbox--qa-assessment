[![Generic badge](https://img.shields.io/badge/version-1.0.0-green.svg)](https://shields.io/)

# Desafio QA BossaBox

## **Instruções**
Você deve criar duas rotinas de teste simples, uma _**end-to-end**_ e um teste de integração. 

_Obs. 1: Você pode construir estes testes com a(s) ferramenta(s) de sua preferência._

_Obs. 2: O tempo esperado para realização deste teste é de **20~40 minutos**._

## **Avaliação**
Neste teste, serão avaliadas suas capacidades sobre:
1. Conceitos de testes
2. Rotinas de teste
3. Validação de cenário e suas diferentes possibilidades
4. Priorização
5. Conceitos fundamentais como manipulação do DOM e APIs RESTful

### **Teste E2E**
Crie uma rotina de testes automatizados que acesse o endereço `dev.app.bossabox.com`, clique em _"Cadastre-se"_, preencha os campos e clique em _"Cadastrar"_. 

**Informações**:
- Não é necessário preencher a segunda etapa do cadastro. A ideia é garantir que o cadastro inicial esteja funcionando corretamente, e que as validações necessárias estão sendo realizadas._
- Você deve testar todos as derivações do cenário ideal que julgar necessário.

### **Teste de integração**
Crie uma rotina de testes automatizados que faça uma requisição **POST** para o endereço `https://drj335kkci.execute-api.sa-east-1.amazonaws.com/dev/v1/users`. 

**Informações**: 
- Você deve testar quantos cenários julgar necessário para validação do funcionamento esperado da API.
- Se você, por acaso, encontrar um comportamento inesperado em qualquer um dos testes, crie um cenário para validação do mesmo e inclua o teste falhando no entregável final.

_Obs.: A documentação para esse endpoint está incluída neste repositório em `docs/api.html`._