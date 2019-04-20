# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create name: "Electronic"
Category.create name: "Music"

User.create first_name: "admin", last_name: "admin", email: "admin@admin.com", password: "admin", role: "admin"
User.create first_name: "user", last_name: "normal", email: "user@normal.com", password: "user"
