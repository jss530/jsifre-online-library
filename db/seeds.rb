# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create([{ name: 'Fiction' }, { name: 'Romance' }, { name: 'Sci-fi' }, { name: 'History' }, { name: 'Young Adult' }, { name: 'Self-help' }, { name: 'Autobiographies' }, { name: 'Travel' }])

Comment.create(body: 'I loved this.', book_id: 1)

Book.create(title: "Mr. Penumbra's 24-Hour Bookstore", author: "Robin Sloan", year: 2013, description: "It's exactly what it sounds like! An establishment you have to enter and will never want to leave.", inventory: 2, user_id: 1, genre_id: 1)

Book.create(title: "Wake Up Sir", author: "Jonathan Ames", year: 2004, description: "By the creator of Bored to Death and The Extra Man", inventory: 1, user_id: 1, genre_id: 1)

User.create(email: 'jackie@me.com', password: '12345678', credits: 5)