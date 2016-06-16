class CreatePeople < ActiveRecord::Mbefore_action :authenticate_user!igration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :dni
      t.string :phone
      t.string :mobile
      t.string :skype
      t.string :email
      t.text :address
      t.date :birthday
      t.integer :civil_status, null: false, default: 0

      t.string :slug
      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_index :people, :deleted_at
    add_index :people, :slug, unique: true
  end
end
