require "pdf"
class SalaryDetailsController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def index
  #  @salary_details = SalaryDetail.all
  end

  def new
    @salary_detail = SalaryDetail.new
  end

  def salary_detail_pdf
    @profiles = Staff.fetch_by_ids(SalaryDetail.pluck(:profile_id))
    html_string = render_to_string(:template => "salary_details/staff_invoice.html.erb",locals: {profiles: @profiles})
    pdf_path = Pdf.execute_pdf(html_string)
    send_file(pdf_path,
      :type => 'application/pdf/docx/html/htm/doc',
      :disposition => 'attachment')
    # render nothing: true
  end
  #
  #
  def edit
  end
  #
  private
  #
  def find_by_id
    @salary_detail = SalaryDetail.find_by_id params[:id]
  end
end
