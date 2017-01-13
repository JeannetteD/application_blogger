# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Seed creates the users and the comments so when you place in your terminal "rake db:reset" this drops and recreates your table, then in your terminal put "rake db:seeds" this put the data you put in the seeds.rb file automatically.  Remember to restart the server "rails s".
user_1 = User.create({email: "user1@user.com", password: "password", password_confirmation: "password" })
user_2 = User.create({email: "user2@user.com", password: "password", password_confirmation: "password" })
user_3 = User.create({email: "user3@user.com", password: "password", password_confirmation: "password" })


user_1.posts.create(title: 'Post 1', body: "This is a great post about dolphins.")
user_2.posts.create(title: 'Post 2', body: "This is a great post about cats.")
user_3.posts.create(title: 'Post 3', body: "This is a great post about dogs.")


user_1 = Comment.create(name: 'Name User1', body: "Dolphins are a widely distributed and diverse group of aquatic mammals. They are an informal grouping within the order Cetacea, excluding whales and ....")
user_2.comment(name: 'Name User2', body: "The domestic cat (Latin: Felis catus) is a small, typically furry, carnivorous mammal. They are often called house cats when kept as indoor pets or simply cats ...")
user_3.comment(name: 'Name user3', body: "TThe domestic dog is a member of genus Canis (canines) that forms part of the wolf-like canids, and is the most widely abundant carnivore. The dog and the ...")
