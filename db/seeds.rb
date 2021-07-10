# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def run_seed
 64.times do 
    cusine = ["chinese", "italian", "japanese", "french", "belgian"].sample
    stars = (1..5).to_a.sample

    restaurant = Restaurant.new(
      name: Faker::Restaurant.name,
      address: Faker::Address.street_address,
      phone_number: Faker::PhoneNumber.phone_number_with_country_code,
      category: cusine
      )
      restaurant.save
    review = Review.new(
      rating: stars,
      content: Faker::Lorem.paragraph_by_chars,
      restaurant_id: restaurant.id
      )
    review.save
      puts "#{restaurant.id} seeded deeply in da base"
  end
end

puts "Clearing the database"
Restaurant.destroy_all
Review.destroy_all
puts "Database Cleared!"
puts "Procedding to seed......"
run_seed
puts "Seeded !!!!!"
    