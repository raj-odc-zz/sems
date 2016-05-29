class DashboardController < ApplicationController

  def index
    @class_list = ClassList.all
    @staff_list = Staff.all
    @student_list = Student.all
    @female_staff = Staff.female_staff
    @male_staff = Staff.male_staff
    @month_list = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
  end
end
