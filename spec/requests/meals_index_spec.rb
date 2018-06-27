require 'rails_helper'

describe 'GET /api/v1/meals' do
  describe 'json' do
    let(:meal_keys) { %w[id name foods] }
    let(:food_keys) { %w[id name calories] }

    it 'renders expected json' do
      create_list(:meal, 3)
      get '/api/v1/meals'

      body = JSON.parse(response.body)
      m1   = body[0]
      f1   = m1['foods'][0]

      m1.keys.each do |key|
        expect(key).to be_in(meal_keys)
      end

      f1.keys.each do |key|
        expect(key).to be_in(food_keys)
      end
    end
  end
end
