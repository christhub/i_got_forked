require('spec_helper')

describe(Recipe) do
  describe('#ingredients') do
    it('lists a recipes ingredients') do
      test_recipe = Recipe.create({:name => 'Green Bean Casserole', :cooking_time => 35, :preparation_time => 10, :serving_size => 1, :rating => nil, :total_time => 40, :instructions => 'bake'})
      test_ingredient = Ingredient.create({:name => 'green beans'})
      # test_ingredient2 = Ingredient.create({:name => 'cream of mushroom'})
      ingredient_recipe_test = Unit.create({:unit => "2 cans", :recipe_id => test_recipe.id(), :ingredient_id => test_ingredient.id()})
      # ingredient_recipe_test2 = Unit.create({:unit => "1 can", :recipe_id => test_recipe.id(), :ingredient_id => test_ingredient2.id()})
      expect(test_recipe.units).to(eq([ingredient_recipe_test]))
    end
  end

  # describe('#category') do
  #   it('lists a recipes category') do
  #     test_recipe = Recipe.new({:name => 'Green Bean Casserole'})
  #     test_recipe.save()
  #     test_category = Category.new({:name => 'Thanksgiving'})
  #     test_category.save()
  #     test_category2 = Category.new({:name => 'Comfort Food'})
  #     test_category2.save()
  #     test_recipe.categories.push(test_category)
  #     test_recipe.categories.push(test_category2)
  #     expect(test_recipe.categories()).to(eq([test_category, test_category2]))
  #   end
  # end

  describe('#split_instructions') do
    it('adds html notation to the instructions page') do
      instructions = "1. a 2. b 3. c"
      name = "Name"
      test_instructions = Recipe.create({name: name, instructions: instructions})
      expect(test_instructions.instructions).to(eq("1. a <br> 2. b <br> 3. c"))
    end
  end

end
