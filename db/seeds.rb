# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts "Registering Categories..."
categories = [ "Animais e acessórios",
               "Esportes",
               "Para a sua casa",
               "Eletrônicos e celulares",
               "Música e hobbies",
               "Bebês e crianças",
               "Moda e beleza",
               "Veículos e barcos",
               "Imóveis",
               "Empregos e negócios"]

categories.each do |category|
  Category.find_or_create_by(description: category)
end

puts "Registering Categories...[OK]"

##################################

puts "Registering Default Admin..."

Admin.create!(
  name: "Administrador Geral",
  email: "admin@admin.com",
  password: "123456",
  password_confirmation: "123456",
  role: 0
)

puts"Registering Default Admin...[OK]"

puts "Registering Default Member..."

Member.create!(
  email: "member@member.com",
  password: "123456",
  password_confirmation: "123456"
)

puts"Registering Default Member...[OK]"