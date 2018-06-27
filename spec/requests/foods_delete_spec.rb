require 'rails_helper'

describe 'DELETE /api/v1/foods/:id' do
  describe 'successfull request' do
    before do
      @food = create(:food)
    end

    it 'deletes the food and returns a 204 status' do
      expect(Food.all.size).to eq(1)

      delete "/api/v1/foods/#{@food.id}"

      expect(Food.all.size).to eq(0)
      expect(response.status).to eq(204)
    end
  end

  describe 'food does not exist' do
    it 'responds with a 404 status' do
      delete "/api/v1/foods/0"

      expect(response.status).to eq(404)
    end
  end
end
