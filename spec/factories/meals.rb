FactoryBot.define do
  factory :meal do
    name "Breakfast" 
    foods { create_list(:food, 2) }
  end
end
