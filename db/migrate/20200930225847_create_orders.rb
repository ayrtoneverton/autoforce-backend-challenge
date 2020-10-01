class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :reference, null: false, index: { unique: true }
      t.text :address, null: false
      t.text :line_items, null: false
      t.float :total_value, null: false
      t.references :user, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.references :delivery_service, null: false, foreign_key: true
      t.references :purchase_channel, null: false, foreign_key: true
      t.references :batch, foreign_key: true

      t.timestamps
    end
  end
end
