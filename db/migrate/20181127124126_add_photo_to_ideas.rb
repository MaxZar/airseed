class AddPhotoToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :photo, :string
  end
end
