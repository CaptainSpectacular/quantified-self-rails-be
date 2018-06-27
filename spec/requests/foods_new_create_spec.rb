require 'rails_helper'

describe 'POST /api/v1/foods' do
  describe 'with name and calories in parameters' do
    describe 'successfull request' do
      it 'adds the food to the database' do
        post '/api/v1/foods?name=Cake&calories=100', params: { food: { name: "Cake", calories: 100 } }

        food = Food.last

        expect(food.name).to eq("Cake")
        expect(food.calories).to eq(100)
      end

      it 'renders the json of the food' do
        post '/api/v1/foods?name=Cake&calories=100', params: { food: { name: "Cake", calories: 100 } }

        body = JSON.parse(response.body)

        expect(body['name']).to eq("Cake")
        expect(body['calories']).to eq(100)
      end
    end

    describe 'bad request' do
      describe 'it must have all valid params' do
        it 'must have calories ' do
          post '/api/v1/foods?name=Cake&calories=100', params: { food: { name: "Cake"} }

          expect(Food.all.size).to eq(0)
          expect(response.status).to eq(400)
        end

        it 'must have a name ' do
          post '/api/v1/foods?name=Cake&calories=100', params: { food: { calories: 100 } }

          expect(Food.all.size).to eq(0)
          expect(response.status).to eq(400)
        end
      end
    end
  end
end
