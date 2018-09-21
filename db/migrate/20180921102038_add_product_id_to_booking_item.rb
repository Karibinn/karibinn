class AddProductIdToBookingItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :booking_items, :product, foreign_key: false
  end
end
