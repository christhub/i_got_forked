class Newtable < ActiveRecord::Migration
  def change
    drop_table(:ingredients_recipes)

    create_table(:units) do |t|
      t.column(:recipe_id, :int)
      t.column(:ingredient_id, :int)
      t.column(:unit, :string)
    end
  end
end
