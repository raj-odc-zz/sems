json.data do |json|
  json.array!(@students) do |student|
    json.first_name student.first_name
    json.last_name student.last_name
    json.id student.id
  end
end

json.total @students.size
