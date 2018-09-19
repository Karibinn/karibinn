class AddPriceToRoomType < ActiveRecord::Migration[5.2]
  def change
    add_monetize :room_types, :price
  end
end
