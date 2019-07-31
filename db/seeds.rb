# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Game.destroy_all

# 15.times do
#   User.create(
#     username: Faker::Friends.character, password: 'pwd'
#   )
# end

u1 = User.create!(username: "junaid", password: "pwd")
u2 = User.create!(username: "ethan", password: "pwd")
u3 = User.create!(username: "keith", password: "pwd")
u4 = User.create!(username: "sahnun", password: "pwd")
u5 = User.create!(username: "dan", password: "pwd")

Game.create!(score: 1099, user_id: u1.id)
Game.create!(score: 1000, user_id: u2.id)
Game.create!(score: 500, user_id: u3.id)
Game.create!(score: 600, user_id: u4.id)
Game.create!(score: 700, user_id: u5.id)
