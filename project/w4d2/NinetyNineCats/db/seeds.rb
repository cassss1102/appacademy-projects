# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all

cat1 = Cat.create!(name: 'kas', sex: 'F', color: 'brown', birth_date: Date.new(2016,6,20), description: 'likes to sleep a lot')
cat2 = Cat.create!(name: 'jack', sex: 'M', color: 'black', birth_date: Date.new(1900,6,20), description: 'eats a chunk')

req1 = CatRentalRequest.create!(cat_id: cat1.id, start_date: Date.new(2017,06,20), end_date: Date.new(2018,06,20), status: "PENDING")
req2 = CatRentalRequest.create!(cat_id: cat2.id, start_date: Date.new(2017,06,20), end_date: Date.new(2018,06,20), status: "PENDING")
