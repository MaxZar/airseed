class AddValidatedToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :validated, :boolean
  end
end
