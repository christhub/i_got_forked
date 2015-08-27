class DeleteColumn < ActiveRecord::Migration
  def change
    remove_column(:ingredients, :units, :string)
    add_column(:ingredients_recipes, :units, :string)
  end
end
