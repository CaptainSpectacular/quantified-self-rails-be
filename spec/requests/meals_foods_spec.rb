require 'rails_helper'

describe 'GET /api/v1/meals/:id/foods' do
  describe 'successfull request' do
    before do
      @meal = create(:meal)
    end

    it 'shows meal information' do
      meal_keys = %w[id name foods]
      food_keys = %w[id name calories]

      get "/api/v1/meals/#{@meal.id}/foods"

      body = JSON.parse(response.body)
      f1   = body['foods'][0]

      body.keys.each do |key|
        expect(key).to be_in(meal_keys)
      end

      f1.keys.each do |key|
        expect(key).to be_in(food_keys)
      end
    end
  end
end
