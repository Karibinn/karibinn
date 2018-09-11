class RemoveForeignKeyAgain < ActiveRecord::Migration[5.2]
  def change
    if foreign_key_exists?(:booking_items, :products)
      remove_foreign_key :booking_items, :products
    end
  end
end
