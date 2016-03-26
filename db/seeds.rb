# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
subjects = ["sub_1","sub_2","sub_3"]
exam_types = ["exam_1","exam_2","exam_3"]
User.where("username =?","admin").destroy_all
Board.where("name =?","test clg").destroy_all
BoardType.where("name =?","test type").destroy_all
ProfileType.where("name =?","Test Profile").delete_all
Role.where("name =?","admin").destroy_all
ClassList.where("class_name =?","test").destroy_all
AddressType.where("name IN(?)", ["primary","secondary"]).delete_all
Subject.where("name IN(?)",subjects).delete_all
ExamType.where("name IN(?)",exam_types).delete_all
role =Role.create({name: "admin"})
User.create!({username: "admin",:email => "arunkumarit02@gmail.com", :role_id => role.id, :password => "admin123", :password_confirmation => "admin123" })
board_type = BoardType.create(:name => "test type")
board = Board.create(:name => "test clg", :board_type_id => board_type.try(:id))
class_list=ClassList.create(board_id: board.id,class_name: "test",section: "A",major:"CSE")
ProfileType.create(:name => "Test Profile")
AddressType.create({:name => "primary"})
AddressType.create({:name => "secondary"})
subjects.each {|sub| Subject.create(:class_list_id => class_list.id,name: sub)}
