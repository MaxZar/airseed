class AddAvratingsToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :avratings, :float, default: 0
  end
end
