class Api::BoardTypesController < ApplicationController
  before_action :find_by_id, only: [:update,:destroy]
  #
  def index
    board_type = BoardType.all
    respond_to do |format|
      format.json { render json: { data: board_type,total: board_type.size}}
    end
  end
  #
  def create
    board_type = BoardType.create(permit_all_params(:board_type))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @board_type.try(:errors).try(:messages)}
  end
  #
  def update
    @board_type.update_attributes(permit_all_params(:board_type))
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @board_type.try(:errors).try(:messages)}
  end
  #
  def destroy
    @board_type.destroy
    render json: { status: 200}
  rescue
    render json: { status: 500,error: @board_type.try(:errors).try(:messages)}
  end
  #
  private
  #
  def find_by_id
    @board_type = BoardType.find_by_id params[:id]
  end
end
