json.data do |json|
  json.array!(@students) do |student|
    json.id student.id
  end
end

json.total @students.size
