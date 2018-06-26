require 'rails_helper'

describe 'GET to api/v1/foods' do
  describe 'json' do

    it 'renders expected json' do
      create_list(:food, 3)
      get '/api/v1/foods'

      body = JSON.parse(response.body)
      keys = %w[id name calories]

      body[0].keys.each do |key|
        expect(key).to be_in(keys)
      end
    end
  end
end
