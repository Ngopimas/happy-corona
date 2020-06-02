# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Event.create!(title: 'Marathon', description: 'Grosse course à pied de moins de 10 personnes', user_id: User.last.id)
  Event.create!(title: 'Apero Géant', description: 'Vins, Bières et pétanques', user_id: User.last.id)
