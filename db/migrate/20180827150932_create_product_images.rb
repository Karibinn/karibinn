class CreateProductImages < ActiveRecord::Migration[5.2]
  def up
    create_table :product_images do |t|
      t.string :image
      t.text :description
      t.references :product
    end

    remove_column :products, :images
  end

  def down
    drop_table :product_images
    add_column :products, :images, :json
  end
end
