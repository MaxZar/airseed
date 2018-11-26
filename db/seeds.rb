# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


User.destroy_all

user_array = []

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  my_hash = {
    email: Faker::Internet.email("#{first_name} #{last_name}", '_'),
    first_name: first_name,
    last_name: last_name,
    password: Faker::Internet.password(10, 20)
  }
  user_array << my_hash
end

User.create!(user_array)


Idea.destroy_all
idea_array = []
10.times do
  my_hash = {
    user_id: User.order("RANDOM()").first.id,
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph_by_chars(rand(100..500), false),
    category: Faker::Company.industry,
    revenue_model: "",
    pricing: rand(100..200),
    start_date: Faker::Date.forward(1),
    end_date: Faker::Date.forward(100 + rand(1..100)),
    minimum_duration: rand(1..3),
    application_criteria: "any"
  }
  idea_array << my_hash
end
Idea.create!(idea_array)
