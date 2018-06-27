class MealSerializer < ActiveModel::Serializer
  has_many :foods
  attributes :id, :name, :foods
end
