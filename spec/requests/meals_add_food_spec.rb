require 'rails_helper'

describe 'POST /api/v1/meals/:meal_id/foods/:id' do
  describe 'successfull request' do
    before do
      @meal = Meal.create(name: 'Lunch')
      @food = create(:food)
    end

    it 'adds a food to a meal' do
      post "/api/v1/meals/#{@meal.id}/foods/#{@food.id}" 

      body = JSON.parse(response.body)

      expect(@meal.foods).to include(@food)
    end
  end

  describe 'bad request' do
    it 'meal does not exist' do
      food = create(:food)
      post "/api/v1/meals/0/foods/#{food.id}" 

      expect(response.status).to eq(404)
    end

    it 'food does not exist' do
      meal = create(:meal)
      post "/api/v1/meals/#{meal.id}/foods/0" 

      expect(response.status).to eq(404)
    end
  end
end
