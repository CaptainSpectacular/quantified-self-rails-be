require 'rails_helper'

describe 'PATCH /api/v1/foods/:id' do
  describe 'successfull request' do
    before do
      @food = create(:food)
    end

    it 'updates the food' do
      patch "/api/v1/foods/#{@food.id}", params: { food: { name: 'Cake', calories: '400' } }

      @food = Food.find(@food.id)

      expect(@food.name).to eq('Cake')
      expect(@food.calories).to eq(400)
    end
  end

  describe 'bad request' do
    describe 'food not found' do
      it 'renders a 404' do
        patch "/api/v1/foods/0", params: { food: { name: 'Cake', calories: '400' } }
        
        expect(response.status).to eq(404)
      end
    end
  end
end
