class Api::V1::MealsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    render json: Meal.all
  end
end
