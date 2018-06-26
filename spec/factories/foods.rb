FactoryBot.define do
  factory :food do
    name     { generate(:name) } 
    calories { generate(:calories) } 
  end

  sequence :name do |n|
    "Food #{n}"
  end

  sequence :calories do 
    rand(1..100)
  end
end
