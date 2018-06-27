require 'rails_helper'

describe 'DELETE /api/v1/meals/:meal_id/foods/:food_id' do
  describe 'successful request' do
    before do
      @meal = Meal.create(name: 'Lunch')
      @food = create(:food) 
      @meal.foods << @food
    end

    it 'removes the food from the meal' do
      delete "/api/v1/meals/#{@meal.id}/foods/#{@food.id}"

      expect(@meal.foods.size).to eq(0)
    end
  end

  describe 'bad request' do
    it 'food does not exist' do
      food = create(:food)
      delete "/api/v1/meals/0/foods/#{food.id}"

      expect(response.status).to eq(404)
    end

    it 'food does not exist' do
      meal = create(:meal)
      delete "/api/v1/meals/#{meal.id}/foods/0"

      expect(response.status).to eq(404)
    end

    it 'does not remove the anything from the meal' do
      meal = create(:meal)

      expect(meal.foods.size).to eq(2)

      delete "/api/v1/meals/#{meal.id}/foods/0"

      expect(meal.foods.size).to eq(2)
    end
  end
end
