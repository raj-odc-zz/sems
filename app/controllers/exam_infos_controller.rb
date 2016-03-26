class ExamInfosController < ApplicationController
  # layout :fetch_layouts
  before_action :find_by_student, only: [:edit]
  #
  def edit
    @exam_types = ExamType.fetch_by_class @student.try(:class_list_id)
  end
  #
  private
  def find_by_student
    @student = Student.find_by_id params.try(:[],"id")
  end
end
