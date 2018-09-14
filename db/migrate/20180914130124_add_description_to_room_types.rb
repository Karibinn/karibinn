class AddDescriptionToRoomTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :room_types, :description_en, :text
    add_column :room_types, :description_fr, :text
  end
end
