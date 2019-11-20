class DeleteAmountFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :amount
  end
end
