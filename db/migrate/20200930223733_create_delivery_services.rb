class CreateDeliveryServices < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_services do |t|
      t.string :name
    end
  end
end
