json.data do |json|
  json.array!(@class_lists) do |cl|
    json.board_name cl.board_name
    json.class_name cl.class_name
    json.id cl.id
    json.section cl.section
    json.major cl.major
  end
end

json.total @class_lists.size
