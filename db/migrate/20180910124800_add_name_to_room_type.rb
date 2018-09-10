class AddNameToRoomType < ActiveRecord::Migration[5.2]
  def change
    add_column :room_types, :name_en, :string
    add_column :room_types, :name_fr, :string
  end
end
