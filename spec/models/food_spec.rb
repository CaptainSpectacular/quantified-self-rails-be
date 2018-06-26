require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:meal_foods) }
    it { is_expected.to have_many(:meals).through(:meal_foods) }
  end
end
