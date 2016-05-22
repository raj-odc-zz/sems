require "pdf"
class AmountTransactionsController < ApplicationController
  layout :fetch_layouts
  before_action :find_by_id, only: [:edit]
  #
  def index
    #@amount_transactions = AmountTransaction.all
  end

  def new
    @amount_transaction = AmountTransaction.new

  end

  def amount_transaction_pdf
    @profiles = Staff.fetch_by_ids(AmountTransaction.pluck(:profile_id))
    html_string = render_to_string(:template => "amount_transactions/staff_invoice.html.erb",locals: {profiles: @profiles})
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
    @amount_transaction = AmountTransaction.find_by_id params[:id]
  end
end
