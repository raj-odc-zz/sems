json.data do |json|
  json.array!(@salary_details) do |salary_detail|
    json.id salary_detail.id
    json.staff_name salary_detail.profile.name.to_s
    json.fees_type salary_detail.fees_type.name
    json.amount salary_detail.amount
  end
end
json.total @salary_details.count