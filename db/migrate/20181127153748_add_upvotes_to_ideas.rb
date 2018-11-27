class AddUpvotesToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :upvotes, :integer, default: 0
  end
end
