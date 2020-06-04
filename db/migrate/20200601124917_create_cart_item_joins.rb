class CreateCartItemJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_item_joins do |t|

    	t.belongs_to :item, index: true #cette ligne rajoute la référence à la table items
    	t.belongs_to :cart, index: true #cette ligne rajoute la référence à la table carts
      t.timestamps
    end
  end
end
