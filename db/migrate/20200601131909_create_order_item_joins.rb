class CreateOrderItemJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :order_item_joins do |t|

    	t.belongs_to :item, index: true #cette ligne rajoute la référence à la table items
    	t.belongs_to :order, index: true #cette ligne rajoute la référence à la table orders

      t.timestamps
    end
  end
end
