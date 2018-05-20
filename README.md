Para acessar nosso projeto: https://linguime.herokuapp.com

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
- Login/Sign In
- Página Inicial (que direciona para o feed de ensino ou de aprendizado)
- Feed de Ensino (feed onde aparece posts que o usuário logado pode corrigir)
- Feed de Aprendizado (feed onde aparece posts que o usuário logado pode utilizar para aprender)
- Feed Pessoal (feed onde aparece os posts feitos pelo usuário logado)
- Feed de Usuários (feed onde aparece os posts feitos por um usuário específico)
- Opções (página onde o usuário pode deslogar do site, definir as línguas de aprendizado, as línguas mães, entre outras coisas). Foi implementado apenas a visualização e o formulário com os checkbox corretamente pré-selecionados, entretanto encontramos dificuldades ao implementar o controller, esse está sendo nosso foco de implementação atual.
- Post (uma página onde é possível visualizar o post por inteiro com os seus comentários)
- Criação de Post (página onde o usuário pode criar um post)
- Todos os models (exceto pelo bookmark que será no próxima fase). Todos estão funcionando como devem.
- Os scaffolds de todos os models, mas apenas para o development e para testes.

3) O que iremos implementar:
- A funcionalidade do opções (comunicação com o banco de dados)
- Bookmark/Notificações
- Botões de "novas perguntas" e "perguntas anteriores" nas páginas, para melhor organização
- Possivelmente adicionaremos traduções, mas isso não é a prioridade no momento, estamos focando mesmo no site em sí

3) Dificuldades encontradas:
A dificuldade encontrada foi fazer o controller do options. O Usuário deve selecionar no formulário do options as linguas que quer aprender e as que quer ensinar. Para isso, o controler deveria checar cada linguagem e criar ou deletar a relação entre o usuário e linguagem nas tabelas, entretanto encontramos muita dificuldade nessa parte.

4) Instalação:
- Para instalar o projeto, você deve utilizar o rails 5.2.0 e o ruby 2.5.1p57 e o postgress que podem ser instalados seguindo esse tutorial: https://gorails.com/setup/ubuntu/16.04
- Crie um usuário "linguime" com senha "linguime" no postgress
- Na pasta linguime, certifique-se de que as versões do rails e do ruby são as mesmas das descritas a cima, caso não esteja, execute os comandos "cd", "/bin/bash --login", "rvm use 2.5.1 --default" e volte para a pasta linguime.
- Na pasta linguime, execute os comandos "rails db:drop", "rails db:create", "rails db:migrate", "rails db:seed".
- Execute "rails server" para "rodar" o servidor.
- No navegador, digite o endereço "localhost:3000".
- Utilize o usuário "igor", com a senha "#$taawktljasktlw4aaglj", ele está aprendendo alemão e japonês e está ensenando inglês e português.


