class AlterDatabase < ActiveRecord::Migration
  def change
    add_column(:ingredients, :units, :string)
  end
end
