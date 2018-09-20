class AddDataToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :phone, :string
    add_column :bookings, :first_name, :string
    add_column :bookings, :last_name, :string
    add_column :bookings, :email, :string
    add_column :bookings, :country, :string
    add_column :bookings, :number_of_adults, :integer
    add_column :bookings, :number_of_children, :integer
  end
end
