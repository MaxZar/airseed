class AddCoordinatesToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :latitude, :float
    add_column :ideas, :longitude, :float
  end
end
