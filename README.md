Para acessar nosso projeto: https://linguime.herokuapp.com  
Faça login com usuário "talys" e senha "linguime"  
Link do trello: https://trello.com/b/Ehv93O52/ep-do-gubi  

0) O projeto é um site onde os usuários podem postar textos na língua que estão aprendendo e corrigir textos escritos em lingua que eles dominam.
Dessa maneira, a comunidade no site constrói um crescimento mútuo linguístico pelo ensino e aprendizado através da escrita e correções de texto em forma de posts.

1) O banco de dados é modelado pelos seguintes componentes:

- Usuário
- Língua mãe (ou nativa)
- Língua de aprendizado
- Post
- Comentário
- Bookmark (favoritos)
- AuthorCommentPost (faz a relação entre comentários e um post)

A partir desses elementos, o model do projeto é construído.

2) Funcionalidade implementadas:
- Login/Sign In e Logout
- Página Inicial (que direciona para o feed de ensino ou de aprendizado).
- Feed de Ensino (feed onde aparece posts que o usuário logado pode corrigir).
- Feed de Aprendizado (feed onde aparece posts que o usuário logado pode utilizar para aprender).
- Feed Pessoal (feed onde aparece os posts feitos pelo usuário logado).
- Feed de Usuários (feed onde aparece os posts feitos por um usuário específico).
- Opções (página onde o usuário pode definir as línguas de aprendizado e as línguas mães).
- Post (uma página onde é possível visualizar o post por inteiro com os seus comentários).
- Bookmark (marcar um post para o usuário receber notificações de novos comentários).
- Notificações
- Criação de Post (página onde o usuário pode criar um post)
- Todos os models estão funcionando como devem.
- O usuário pode deletar seus comentários/ respostas em um Post
- A funcionalidade do opções (comunicação com o banco de dados)
- Classificação dos posts em dificuldades
- Traduções

4) Testes:
- Implementamos os testes de unidade para todos os modelos, verificando o comportamento do banco ao inserirmos dados válidos ou nulos.
- Implementamos testes para os controladores, em sua maioria verificando os redirecionamentos
- Para rodar os testes, siga os passos da instalação local (5) e execute os comandos `rails db:test:prepare; rake`

5) Instalação Local:
- Essas instruções servem para hostear o projeto localmente em um ambiente de development
- Para instalar o projeto, você deve utilizar o rails 5.2.0 e o ruby 2.5.1p57 e o postgress que podem ser instalados seguindo esse tutorial: https://gorails.com/setup/ubuntu/16.04
- Crie um usuário "linguime" com senha "linguime" no postgress
- Na pasta linguime, certifique-se de que as versões do rails e do ruby são as mesmas das descritas a cima e, caso não sejam, execute os comandos "cd", "/bin/bash --login", "rvm use 2.5.1 --default" e volte para a pasta linguime.
- Execute 'bin/rails db:environment:set RAILS_ENV=development'
- Na pasta linguime, execute os comandos "rails db:drop", "rails db:create", "rails db:migrate", "rails db:seed".
- Execute "rails server" para "rodar" o servidor.
- No navegador, digite o endereço "localhost:3000".
- Utilize o usuário "talys", com a senha "linguime", ele está aprendendo alemão e está ensinando inglês.
