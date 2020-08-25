# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
edouard = User.new(first_name: "Edouard", last_name: "Giroult", birth_date: Date.new(1998, 7, 12), phone_number: "06 21 56 65 45 87", ID_number: "1700569254145", nationality: "française", birth_location: "Lyon", mail: "doudou.giroult@gmail.com", password: "tatamonique", username: "Doudou")

health = Health.new(ssn: "198076915616754", social_security: "SMENO", health_insurance: "Apicil")
health.user = edouard
health.save
