class ChangeValidatedDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:bookings, :validated, nil)
  end
end
