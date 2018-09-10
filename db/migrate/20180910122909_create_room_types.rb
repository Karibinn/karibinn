class CreateRoomTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :room_types do |t|
      t.integer :guest_capacity, default: 2, limit: 1, null: false
      t.integer :bedrooms, default: 1, limit: 1, null: false
      t.integer :single_beds, default: 0, limit: 1, null: false
      t.integer :double_beds, default: 1, limit: 1, null: false
      t.integer :baths, default: 1, limit: 1, null: false
      t.references :property
    end
  end
end
