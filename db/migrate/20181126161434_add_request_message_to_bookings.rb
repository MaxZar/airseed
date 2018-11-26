class AddRequestMessageToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :request_message, :text
  end
end
