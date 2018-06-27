require 'rails_helper'

describe 'GET /api/v1/foods/:id' do
  describe 'successfull request' do
    before do
      @food = create(:food)
    end

    it 'shows food information' do
      get "/api/v1/foods/#{@food.id}"
      keys = %w[id name calories]
      body = JSON.parse(response.body)

      body.keys.each do |key|
        expect(key).to be_in(keys)
      end
    end
  end

  describe 'bad requests' do
    describe 'food does not exist' do
      it 'returns a 404' do
        get "/api/v1/foods/0"
        
        expect(response.status).to eq(404)
      end
    end
  end
end
