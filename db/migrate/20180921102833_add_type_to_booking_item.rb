class AddTypeToBookingItem < ActiveRecord::Migration[5.2]
  def change
    add_column :booking_items, :type, :string,
               null: false, default: 'BookingItems::Property', limit: 32
  end
end
