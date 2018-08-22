class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :slug
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end