class AddAddressToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :address, :string
  end
end
