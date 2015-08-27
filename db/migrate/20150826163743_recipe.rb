class Recipe < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:instructions, :string)
      t.column(:cooking_time, :int)
      t.column(:preparation_time, :int)
      t.column(:total_time, :int)
      t.column(:rating, :int)
      t.column(:serving_size, :int)

      t.timestamps

    end

    create_table(:ingredients) do |t|
      t.column(:name, :string)
    end

    create_table(:categories) do |t|
      t.column(:name, :string)
    end

    create_table(:ingredients_recipes) do |t|
      t.column(:recipe_id, :int)
      t.column(:ingredient_id, :int)
    end

    create_table(:categories_recipes) do |t|
      t.column(:category_id, :int)
      t.column(:recipe_id, :int)
    end

  end
end
