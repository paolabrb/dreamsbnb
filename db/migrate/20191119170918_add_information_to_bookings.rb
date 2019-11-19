class AddInformationToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :amount, :integer
    add_column :bookings, :date_booking, :date
  end
end
