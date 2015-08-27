class Unit < ActiveRecord::Base
  belongs_to(:recipe)
  belongs_to(:ingredient)

  define_singleton_method(:find_by_recipe_and_ingredient) do |recipe_id, ingredient_id|
    Unit.all.each do |unit|
      if unit.recipe_id == recipe_id && unit.ingredient_id == ingredient_id
        return unit
      end
    end
  end
end
