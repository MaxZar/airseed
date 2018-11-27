# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Review.destroy_all
Booking.destroy_all
Idea.destroy_all
User.destroy_all

users_array = []

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  my_hash = {
    email: Faker::Internet.email("#{first_name} #{last_name}", '_'),
    first_name: first_name,
    last_name: last_name,
    admin: false,
    # password: Faker::Internet.password(10, 20)
    password: "kalgrogo"
  }
  users_array << my_hash
end

admin_hash =   my_hash = {
    email: 'master@seed.io',
    first_name: 'Master',
    last_name: 'Seed',
    admin: true,
    # password: Faker::Internet.password(10, 20)
    password: "kalgrogo"
  }

users_array << admin_hash
User.create!(users_array)



ideas_array = []
User.all.each do |user|
  5.times do
    my_hash = {
      user_id: user.id,
      # user_id: User.order("RANDOM()").first.id,
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
    ideas_array << my_hash
  end
end
Idea.create!(ideas_array)

bookings_array = []

20.times do
  available_idea = false
  unless available_idea
    idea = Idea.order("RANDOM()").first
    available_idea = true if !bookings_array.include?(idea)
  end
  user_is_creator = true
  while user_is_creator
    attempt = User.order("RANDOM()").first
    if attempt.id != idea.user_id
      user_is_creator = false
      user_id = attempt.id
    end
  end

  my_hash = {
    idea_id: idea.id,
    user_id: user_id,
    start_date: idea.start_date,
    end_date: idea.end_date,
    request_message: Faker::Lorem.paragraph_by_chars(rand(100..500), false)
  }
  bookings_array << my_hash
end

Booking.create!(bookings_array)

reviews_array = []
Booking.all.each do |booking|
  my_hash = {
    booking_id: booking.id,
    rating: rand(1..5),
    comment: Faker::Lorem.paragraph_by_chars(rand(100..500), false)
  }
  reviews_array << my_hash
end

Review.create!(reviews_array)
