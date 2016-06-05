json.data do |json|
  json.array!(@batch_lists) do |batch|
    json.id batch.id
    json.profile_id batch.profile.id
    json.batch_name batch.batch_list.academic_year
    json.class_name batch.class_list.class_name
    json.section batch.class_list.section
  end
end

json.total @batch_lists.size
