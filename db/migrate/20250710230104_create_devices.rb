class CreateDevices < ActiveRecord::Migration[7.1]
  def change
    create_table :devices do |t|

      t.string :name
      t.string :kind
      t.string :code
      t.integer :status, default: 0
      t.references :store, null: false, foreign_key: true
      t.timestamps
    end
  end
end
