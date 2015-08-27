require('spec_helper')

describe(Recipe) do
  describe('#ingredients') do
    it('lists a recipes ingredients') do
      test_recipe = Recipe.new({:name => 'Green Bean Casserole'})
      test_recipe.save()
      test_ingredient = Ingredient.new({:name => 'green beans'})
      test_ingredient.save()
      test_ingredient2 = Ingredient.new({:name => 'cream of mushroom'})
      test_ingredient2.save()
      test_recipe.ingredients.push(test_ingredient)
      test_recipe.ingredients.push(test_ingredient2)
      expect(test_recipe.ingredients()).to(eq([test_ingredient, test_ingredient2]))
    end
  end

  describe('#category') do
    it('lists a recipes category') do
      test_recipe = Recipe.new({:name => 'Green Bean Casserole'})
      test_recipe.save()
      test_category = Category.new({:name => 'Thanksgiving'})
      test_category.save()
      test_category2 = Category.new({:name => 'Comfort Food'})
      test_category2.save()
      test_recipe.categories.push(test_category)
      test_recipe.categories.push(test_category2)
      expect(test_recipe.categories()).to(eq([test_category, test_category2]))
    end
  end

  describe('#split_instructions') do
    it('adds html notation to the instructions page') do
      instructions = "1. a 2. b 3. c"
      name = "Name"
      test_instructions = Recipe.create({name: name, instructions: instructions})
      expect(test_instructions.instructions).to(eq("1. a <br> 2. b <br> 3. c <br>"))
    end
  end

end
