class Api::V1::FoodsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_food, only: [:destroy]

  def index
    render json: Food.all
  end

  def create
    begin 
      render json: Food.create!(food_params) 
    rescue ActiveRecord::RecordInvalid => invalid
      render json: invalid.record.errors, status: 400
    end
  end

  def destroy
    render json: @food.delete, status: 204
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end

  def set_food
    begin
      @food ||= Food.find(params[:id])
    rescue ActiveRecord::RecordNotFound => invalid
      render json: { message: invalid }, status: 404 
    end
  end
end
