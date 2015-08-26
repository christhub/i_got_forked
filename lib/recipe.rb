class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:categories)
  validates(:instructions, {:presence => true, :length => {:maximum => 50}})
  before_save(:downcase_everything)

private

  define_method(:downcase_everything) do
     self.name=(name().downcase)
     self.instructions=(instructions().downcase())
  end

end
