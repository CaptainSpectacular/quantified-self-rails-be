require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe 'validations' do
    it { is_expected.to have_many(:meal_foods) }
    it { is_expected.to have_many(:foods).through(:meal_foods) }
  end
end
