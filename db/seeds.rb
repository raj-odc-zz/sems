role =Role.find_or_create_by({name: "admin"})
board_type = BoardType.find_or_create_by(:name => "School")
board = Board.find_or_create_by(:name => "school1", :board_type => board_type)
#class_list=ClassList.create(board_id: board.id,class_name: "test",section: "A",major:"CSE")
profile_type = ProfileType.find_or_create_by(:name => "Student")
AddressType.create({:name => "primary"})
AddressType.create({:name => "secondary"})
#subjects.each {|sub| Subject.create(:class_list_id => class_list.id,name: sub)}
#exam_types.each {|name| ExamType.create(:name => name, :class_list_id => class_list.id) }
User.create({username: "admin",:email => "admin@gmail.com",
                 :role_id => role.id, :password => "password",
                 :password_confirmation => "password", :profile_type => profile_type })