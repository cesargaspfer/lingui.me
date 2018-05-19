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
- Opções (página onde o usuário pode deslogar do site, definir as línguas de aprendizado, as línguas mães, entre outras coisas)
- Post (uma página onde é possível visualizar o post por inteiro com os seus comentários)
- Criação de Post (página onde o usuário pode criar um post)
