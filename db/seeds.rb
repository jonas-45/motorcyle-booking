# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Motorcycle.create(name: "Suzuki", image: "https://drive.google.com/file/d/1IFDAhKBwmsjirSRkJQrgfsb5wDKU3qnq/view?usp=sharing", description: "Green Color", price: 700)
Motorcycle.create(name: "Honda", image: "https://drive.google.com/file/d/1QAoQaoBm5BX78DDjLRe5tSa62aK41fYr/view?usp=sharing", description: "Black and White Color", price: 800)
Motorcycle.create(name: "Yamaha", image: "https://drive.google.com/file/d/1ldg-nHBMZEn34B6RNEzWJUEB8tp2SBIi/view?usp=sharing", description: "Blue Color.", price: 400)
Motorcycle.create(name: "Shahab", image: "https://drive.google.com/file/d/1loPiow_igdgwKLvWOYt8f7UJXX86QUBA/view?usp=sharing", description: "Orange Color.", price: 900)
Motorcycle.create(name: "Alburz", image: "https://drive.google.com/file/d/1jRuQsj66LT2x6YeLZjF-hiGJplm2QCin/view?usp=sharing", description: "Black and Green Color.", price: 300)
Motorcycle.create(name: "Alburz", image: "https://drive.google.com/file/d/1jRuQsj66LT2x6YeLZjF-hiGJplm2QCin/view?usp=sharing", description: "Black and Green Color.", price: 200)

User.create(username: 'user1')
User.create(username: 'user2')
User.create(username: 'user3')

puts "Sample users created successfully!"

