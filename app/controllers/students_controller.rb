require 'pdf'
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

  def fees_receipt
   # @profiles = Staff.fetch_by_ids(AmountTransaction.pluck(:profile_id))
    transaction = AmountTransaction.find(params[:id])
    html_string = render_to_string(:template => "students/fees_receipt.html.erb",locals: {transaction: AmountTransaction.last})
    pdf_path = Pdf.execute_pdf(html_string)
    send_file(pdf_path,
              :type => 'application/pdf/docx/html/htm/doc',
              :disposition => 'attachment')
    # render nothing: true
  end
  #
  private
  #
  def find_by_id
    @student = Student.find_by_id params[:id]
  end
end
