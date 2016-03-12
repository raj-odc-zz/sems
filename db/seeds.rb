# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.where("name =?","admin").destroy_all
role =Role.create({name: "admin"})
User.where("username =?","admin").destroy_all
User.create!({username: "admin",:email => "arunkumarit02@gmail.com", :role_id => role.id, :password => "admin123", :password_confirmation => "admin123" })
BoardType.where("name =?","test type").destroy_all
board_type = BoardType.create(:name => "test type")
Board.where("name =?","test clg").destroy_all
board = Board.create(:name => "test clg", :board_type_id => board_type.try(:id))
ClassList.where("class_name =?","test").destroy_all
ClassList.create(board_id: board.id,class_name: "test",section: "A",major:"CSE")


