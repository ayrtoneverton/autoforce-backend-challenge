class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.string :name, null: false, index: { unique: true }
    end

    Status.create :name => "Ready"
    Status.create :name => "Production"
    Status.create :name => "Closing"
    Status.create :name => "Sent"
  end
end
