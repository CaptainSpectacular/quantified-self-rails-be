class Api::V1::MealsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_meal, only: [:show]
  
  def index
    render json: Meal.all
  end

  def show
    render json: @meal
  end

  private

    def set_meal
      begin
        @meal ||= Meal.find(params[:id])
      rescue ActiveRecord::RecordNotFound => invalid
        render json: { message: invalid }, status: 404
      end
    end
end
