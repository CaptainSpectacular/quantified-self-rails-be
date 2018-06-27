require 'rails_helper'

describe 'POST /api/v1/foods' do
  describe 'with name and calories in parameters' do
    it 'adds the food to the database' do
      post '/api/v1/foods?name=Cake&calories=100', params: { name: "Cake", calories: 100 }

      food = Food.last

      expect(food.name).to eq("Cake")
      expect(food.calories).to eq(100)
    end
  end
end
