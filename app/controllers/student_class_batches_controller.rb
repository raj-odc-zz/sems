class StudentClassBatchesController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  def new
    @student_class_batch = StudentClassBatch.new
  end
  private
  #
  def find_by_id
    @student_class_batch = StudentClassBatch.find_by_id params[:id]
  end
end
