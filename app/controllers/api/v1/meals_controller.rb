class Api::V1::MealsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_meal, only: [:show, :update, :destroy]
  before_action :set_food, only: [:update, :destroy]
  
  def index
    render json: Meal.all
  end

  def show
    render json: @meal
  end

  def update
    @meal.foods << @food
    render json: { message: "Successfully added #{@food.name} to #{@meal.name}" }
  
  end

  def destroy
    @meal.foods.destroy(@food)
    render json: { message: "Successfully removed #{@food.name} to #{@meal.name}" }
  end

  private

    def set_meal
      begin
        @meal ||= Meal.find(params[:id])
      rescue ActiveRecord::RecordNotFound => invalid
        render json: { message: invalid }, status: 404
      end
    end

    def set_food
      begin
        @food ||= Food.find(params[:food_id])
      rescue ActiveRecord::RecordNotFound => invalid
        render json: { message: invalid }, status: 404
      end
    end
end
