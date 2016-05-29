class Api::AmountTransactionsController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    @amount_transactions = AmountTransaction.all
    respond_to do |format|
      format.json
    end
  end
  #
  def create
    params['amount_transaction']['parent_type'] = 'FeesStructure'
    params['amount_transaction']['transaction_date'] = Date.today()
    amount_transaction= AmountTransaction.create(permit_all_params(:amount_transaction))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: amount_transaction.try(:errors).try(:messages)}
  end
  #
  def update
    @amount_transaction.update_attributes(permit_all_params(:amount_transaction))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @amount_transaction.try(:errors).try(:messages)}
  end
  #
  def destroy
    @amount_transaction.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @amount_transaction.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @amount_transaction = AmountTransaction.find_by_id params[:id]
  end
end
