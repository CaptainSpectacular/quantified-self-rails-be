class Api::V1::FoodsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Food.all
  end

  def create
    Food.create(food_params)
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
