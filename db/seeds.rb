# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Destroy all"
Idea.destroy_all
User.destroy_all

puts "Create Users"
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

puts "Create Ideas"

first_idea = Idea.create!(
  user_id: User.order("RANDOM()").first.id,
  title: "AlloChien",
  description: "A revolutionary idea for woldwide dog lovers. Learn the pedigree of a random dog with allochien. He barks, and we make the wold's best IA run to retrieve his pedigree. First tests are enthoutiastic. YC has already given 10B$. What's next ?",
  category: "Pet industry",
  revenue_model: "Subscription",
  pricing: rand(100..200),
  start_date: Faker::Date.forward(1),
  end_date: Faker::Date.forward(100 + rand(1..100)),
  minimum_duration: rand(1..3),
  application_criteria: "any"
)

url = "https://images.unsplash.com/photo-1505628346881-b72b27e84530?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8ecbdf99ad1c8e52f00c7f6682a27f27&auto=format&fit=crop&w=934&q=80"
first_idea.remote_photo_url = url
first_idea.save


second_idea = Idea.create!(
  user_id: User.order("RANDOM()").first.id,
  title: "Lobster Farm in France",
  description: "Everyone loves lobsters and they are so expansive. There are no farms...yet. I have been engineering a farm protocol which is working perfectly fine",
  category: "Food",
  revenue_model: "Selling lobsters",
  pricing: rand(100..200),
  start_date: Faker::Date.forward(1),
  end_date: Faker::Date.forward(100 + rand(1..100)),
  minimum_duration: rand(1..3),
  application_criteria: "any"
)

url = "https://images.unsplash.com/photo-1533637224197-c90880aa997c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3a7daa8b052b8610bc402cc80f39facc&auto=format&fit=crop&w=976&q=80"
second_idea.remote_photo_url = url
second_idea.save


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
