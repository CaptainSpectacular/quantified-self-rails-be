class Api::V1::FoodsController < ApplicationController
  skip_before_action :verify_authenticity_token

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

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
