# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  name = Faker::Restaurant.name
  address = Faker::Address.full_address
  phone_number = Faker::PhoneNumber.cell_phone
  category = %w[chinese italian japanese french belgian].sample
  restaurant = Restaurant.create(name: name, address: address, phone_number: phone_number, category: category)
  5.times do
    content = Faker::Restaurant.review
    rating = rand(0..5)
    Review.create(content: content, rating: rating, restaurant_id: restaurant.id)
  end
end



create_table "reviews", force: :cascade do |t|
  t.integer "restaurant_id"
  t.text "content"
  t.integer "rating"
  t.datetime "created_at", precision: 6, null: false
  t.datetime "updated_at", precision: 6, null: false
  t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
end