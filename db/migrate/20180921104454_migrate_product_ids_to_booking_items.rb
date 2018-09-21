class MigrateProductIdsToBookingItems < ActiveRecord::Migration[5.2]
  def up
    BookingItem.joins(:booking).where(product_id: nil).find_each do |item|
      item.product_id = item.room_type.product.id
      item.save!
    end
  end
end
