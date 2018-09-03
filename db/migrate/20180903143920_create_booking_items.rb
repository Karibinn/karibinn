class CreateBookingItems < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_items do |t|
      t.references :booking, foreign_key: true
      t.references :product, foreign_key: true
      t.datetime :date_from, null: false
      t.datetime :date_to, null: false
      t.integer :price_cents, null: false
      t.integer :guests, limit: 1, null: false

      t.timestamps
    end
  end
end
