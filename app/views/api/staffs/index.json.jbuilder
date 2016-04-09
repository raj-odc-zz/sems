json.data do |json|
  json.array!(@staffs) do |staff|
    json.first_name staff.first_name
    json.last_name staff.last_name
    json.id staff.id
    json.sub staff.try(:staff_classes).try(:subject).try(:name)
  end
end

json.total @staffs.size
