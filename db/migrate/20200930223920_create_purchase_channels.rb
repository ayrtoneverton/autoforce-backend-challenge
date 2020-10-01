class CreatePurchaseChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_channels do |t|
      t.string :name, null: false, index: { unique: true }
    end
  end
end
