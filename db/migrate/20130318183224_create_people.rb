class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :email, null: false

      t.timestamps
    end

    add_index :people, :email, unique: true
  end
end
