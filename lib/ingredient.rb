class Ingredient < ActiveRecord::Base
  has_many(:units)
  has_many :recipes, through: :units
  validates(:name, {presence: true})
  before_save(:downcase_name)

private

  define_method(:downcase_name) do
     self.name=(name().downcase())
  end

end
