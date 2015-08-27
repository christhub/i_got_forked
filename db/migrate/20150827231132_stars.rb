class Stars < ActiveRecord::Migration
  def change
    remove_column(:recipes, :rating, :int)
    add_column(:recipes, :rating, :string)
  end
end
