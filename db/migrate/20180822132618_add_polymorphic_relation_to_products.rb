class AddPolymorphicRelationToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :specific, polymorphic: true
  end
end
