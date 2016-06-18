class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :status, null: false, default: 0
      t.integer :type, null: false, default: 0
      t.float :cost
      t.references :client
      t.references :collaborator

      t.string :slug
      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_index :clients, :slug, unique: true
    add_index :clients, :deleted_at
  end
end
