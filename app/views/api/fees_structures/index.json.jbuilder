json.data do |json|
  json.array!(@fees_structures) do |fees_structure|
    json.id fees_structure.id
    json.class_name fees_structure.class_list.class_name
    json.fees_type fees_structure.fees_type.name
    json.amount fees_structure.amount
  end
end
json.total @fees_structures.count