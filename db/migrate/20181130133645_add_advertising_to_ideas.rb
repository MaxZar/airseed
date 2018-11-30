class AddAdvertisingToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :is_ad, :boolean, default: false
  end
end
