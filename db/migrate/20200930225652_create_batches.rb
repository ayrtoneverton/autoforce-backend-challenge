class CreateBatches < ActiveRecord::Migration[6.0]
  def change
    create_table :batches do |t|
      t.string :reference
      t.references :purchase_channel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
