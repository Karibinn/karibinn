class AddPriceToActivity < ActiveRecord::Migration[5.2]
  def change
    add_monetize :activities, :price
  end
end
