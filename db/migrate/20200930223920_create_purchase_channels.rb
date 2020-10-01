class CreatePurchaseChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_channels do |t|
      t.string :name
    end
  end
end
