require('spec_helper')

describe(Unit) do
  describe('.find_by_recipe_and_ingredient') do
    it('finds a unit by its recipe and ingredient id') do
      test_recipe = Recipe.create({:name => 'Green Bean Casserole', :cooking_time => 35, :preparation_time => 10, :serving_size => 1, :rating => nil, :total_time => 40, :instructions => 'bake'})
      test_ingredient = Ingredient.create({:name => 'green beans'})
      test_unit = Unit.create({:unit => "2 cans", :recipe_id => test_recipe.id(), :ingredient_id => test_ingredient.id()})
      expect(Unit.find_by_recipe_and_ingredient(test_recipe.id, test_ingredient.id))
    end
  end
end
