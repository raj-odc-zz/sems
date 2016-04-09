class StudentsController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def index
  end

  def new
    @student = Student.new
  end
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @student = Student.find_by_id params[:id]
  end
end
