class Recipe < ActiveRecord::Base
  has_many :units
  has_many :ingredients, through: :units
  has_and_belongs_to_many :categories
  validates :instructions, {:presence => true, :length => {:maximum => 1000}})
  before_save :downcase_everything
  before_save :split_instructions
  before_save :make_stars

private

  def :downcase_everything
     self.name = name.downcase
     self.instructions = instructions.downcase
  end

  def split_instructions
    numbers = ["2.", "3.", "4.", "5."]
    pre_numbers = '<br><br><span class="ingredient-display">'
    post_numbers = "</span>"
    pre_one  = '<span class="ingredient-display">'
    post_one = "</span>"
    split_instructions = self.instructions.split(" ")
    if split_instructions & numbers
      joined_instructions = []
      split_instructions.each do |word|
        if numbers.include? word
          joined_instructions.push(pre_numbers, word, post_numbers)
        elsif word == "1."
          joined_instructions.push(pre_one, word, post_one)
        else
          joined_instructions.push(word)
        end
      end
    instructions = joined_instructions.join(" ")
    end
    self.instructions = instructions
    # binding.pry
  end

  def make_stars
    stars = []
    rating = self.rating.to_i
    idx = 0
    while idx < rating
      stars.push("&#9733;")
      idx=+
    end
    self.rating = stars.join(" ")
  end

end
