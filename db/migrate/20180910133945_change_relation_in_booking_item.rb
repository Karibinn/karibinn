class ChangeRelationInBookingItem < ActiveRecord::Migration[5.2]
  def up
    # change_column :booking_items, :product_id, :integer, foreign_key: false
    # remove_foreign_key :booking_items, :products

    rename_column :booking_items, :product_id, :room_type_id
  end

  def down
    rename_column :booking_items, :room_type_id, :product_id
    change_column :booking_items, :product_id, :integer
  end
end
