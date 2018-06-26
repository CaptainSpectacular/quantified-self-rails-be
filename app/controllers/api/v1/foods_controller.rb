class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def create
    Food.create(food_params)
  end

  private

  def food_params
    params.permit(:name, :calories)
  end
end
