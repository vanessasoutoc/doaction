# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#cidades table
#json = ActiveSupport::JSON.decode(File.read('/home/vanessa/dumps/cities/cidades.json'))

#json.each do |a|
#  City.create!(a)
#end
ongs = Ong.create([{id: 1, name: 'Ong Teste da Vanessa', name_fantasy: 'Ong teste da Vanessa NM fantasy', cnpj: '12345'}])

addresses = Address.create([{id: 1, street: 'Rua Rogerio Batista', number: 253, complement: 'ap 106', zipcode: 38060510, city: 'Uberaba', state: 'MG', neighborhood: 'Irmãos Soares'},{id: 2, street: 'Rua Uberlandia', number: 355,  zipcode: 38120000, city: 'Conceição das Alagoas', state: 'MG', neighborhood: 'Centro'}])

users = User.create([{id: 1, name: 'Vanessa Souto', email: 'vanessasoutoc@gmail.com', password:'vane5060', password_confirmation:'vane5060', ong_id: 1, address_id: 1},{id: 2, name: 'Nayara Pantaleão', email: 'nanapantaleao@gmail.com', password:'vane5060', password_confirmation:'vane5060', address_id: 2}])