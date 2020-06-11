# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.destroy_all

# Event.create!(title: 'Marathon', description: 'Grosse course à pied de moins de 10 personnes', user_id: User.last.id)
# Event.create!(title: 'Apero Géant', description: 'Vins, Bières et pétanques', user_id: User.last.id)

marathon = { title: "Marathon", description: "Grosse course à pied de moins de 10 personnes", user_id: User.last.id, location: 'Paris', price: 50, date: Time.now+rand(1..20)*60*60*24, category: "Quarantine body challenge"}
apero = { title: "Apéro géant", description: "Vins, Bières et pétanques, amenez couverts et torchons", user_id: User.last.id, location: 'Bois de Boulogne', price: 0, date: Time.now+rand(1..20)*60*60*24, category: "Food"}
picnic = { title: "Picnic champêtre", description: "Picnic à la campagne au bord de l'eau sur une nappe Vichy", user_id: User.last.id, location: 'Bords de Marne', price: 0, date: Time.now+rand(1..20)*60*60*24, category: "Food"}
mousse = { title: "Soirée CoronaMousse", description: "Soirée club avec distanciation sociale incluse et mousse hydroalcoolique pour éliminer toute propagation de virus liée à la sudation", user_id: User.last.id, location: 'Macumba', price: 15, date: Time.now+rand(1..20)*60*60*24, category: "Soirées CoronaMousse"}
art = { title: "Exposition les masques dans l'histoire", description: "Exposition sur le thème des masques à travers l'histoire et leurs symboliques", user_id: User.last.id, location: 'Grand Palais', price: 20, date: Time.now+rand(1..20)*60*60*24, category: "CoronArt"}
#afterwork = { title: "Soirée spéciale afterwork", description: "Bières et molky, la meilleure recette pour décompresser", user_id: User.last.id, location: 'Canal Saint-Martin', price: 0, date: Time.now+rand(1..20)*60*60*24, category: "Soirées CoronaMousse"}

[ marathon, apero, picnic, mousse, art ].each do |attributes|
  event = Event.create!(attributes)
end
