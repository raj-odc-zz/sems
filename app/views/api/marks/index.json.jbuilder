json.data do |json|
  json.array!(@marks) do |mark|
    student = mark.try(:profile)
    exam = mark.try(:exam_type)
    sub = mark.try(:subject)
    json.first_name student.try(:first_name)
    json.last_name student.try(:last_name)
    json.student_id student.try(:id)
    json.exam_type exam.try(:name)
    json.mark mark.try(:mark)
    json.id mark.try(:id)
  end
end

json.total @marks.size
