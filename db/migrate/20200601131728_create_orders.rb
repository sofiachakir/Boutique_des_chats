class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :stripe_customer_id
      t.belongs_to :user, index: true #cette ligne rajoute la référence à la table users
      t.timestamps
    end
  end
end
