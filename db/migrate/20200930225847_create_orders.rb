class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :reference
      t.text :address
      t.text :lineItems
      t.float :totalValue
      t.references :user, null: false, foreign_key: true
      t.references :delivery_service, null: false, foreign_key: true
      t.references :purchase_channel, null: false, foreign_key: true
      t.references :batch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
