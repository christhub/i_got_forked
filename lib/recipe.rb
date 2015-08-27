class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:categories)
  validates(:instructions, {:presence => true, :length => {:maximum => 1000}})
  before_save(:downcase_everything)
  before_save(:split_instructions)

private

  define_method(:downcase_everything) do
     self.name=(name().downcase)
     self.instructions=(instructions().downcase())
  end

  def split_instructions
    numbers = ["1.", "2.", "3.", "4."]
    split_instructions = self.instructions.split(" ")
    if split_instructions & numbers
      joined_instructions = []
      split_instructions.each do |word|
        if numbers.include? word
          joined_instructions.push(word)
          joined_instructions.push("<br>")
        else
          joined_instructions.push(word)
        end
      end
    instructions = joined_instructions.join(" ")
    binding.pry
    return instructions
    end
  end

end
