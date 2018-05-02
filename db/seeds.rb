# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#USERS
igor = User.new
igor.email = 'igor@allan.com'
igor.password = '#$taawktljasktlw4aaglj'
igor.username = 'igor'
igor.save!

allan = User.new
allan.email = 'allan@allan.com'
allan.password = '#$taawktljasktlw4aaglj'
allan.username = 'allan'
allan.save!

renan = User.new
renan.email = 'renan@allan.com'
renan.password = '#$taawktljasktlw4aaglj'
renan.username = 'renan'
renan.save!

cesar = User.new
cesar.email = 'cesar@allan.com'
cesar.password = '#$taawktljasktlw4aaglj'
cesar.username = 'cesar'
cesar.save!

#LANGUAGES
LearningLanguage.create(user: igor, language:'alemão')
LearningLanguage.create(user: igor, language:'alemão')
LearningLanguage.create(user: igor, language:'japonês')
LearningLanguage.create(user: allan, language:'inglês')
LearningLanguage.create(user: renan, language:'alemão')
LearningLanguage.create(user: cesar, language:'hebraico')

MotherLanguage.create(user:igor, language:'português')
MotherLanguage.create(user:igor, language:'inglês')
MotherLanguage.create(user:allan, language:'português')
MotherLanguage.create(user:renan, language:'inglês')
MotherLanguage.create(user:cesar, language:'ídiche')

#POST
post_igor = Post.create( upvotes:10, user:igor, difficulty:2,
        learning_language:'alemão', mother_language:'inglês', title:"Wie kann man \"potato\" sagen?", text:"I want to order baked potatoes in Germany. Help me, plz")

post_allan = Post.create( upvotes:15, user:allan, difficulty:5,
        learning_language:'inglês', mother_language:'português', title:"Como se diz remoer em inglês", text:"Remoer no sentido de insistir no passado")

post_renan = Post.create( upvotes:1, user:renan, difficulty:4,
        learning_language:'alemão', mother_language:'português', title:"Como se diz a mulher bebe leite?", text:"Está correto? Die Frau trinkt Milch")

post_cesar = Post.create( upvotes:2, user:cesar, difficulty:1,
        learning_language:'ídiche', mother_language:'hebraico', title:"Boker Tov", text:"Gutn morgn?")

Bookmark.create(user: igor, post: post_allan)
Bookmark.create(user: igor, post: post_allan)

comment_renan = Comment.create(upvotes: 100, text: "Ruminate, dwell on, nibble, mull over. Bjs")
AuthorCommentPost.create(user: renan, comment: comment_renan, post: post_allan)

comment_igor = Comment.create(upvotes: 50, text: "Sim, está correto. Bjs")
AuthorCommentPost.create(user: igor, comment: comment_igor, post: post_renan)
