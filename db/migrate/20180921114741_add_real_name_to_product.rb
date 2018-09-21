class AddRealNameToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :real_name, :string
  end
end
