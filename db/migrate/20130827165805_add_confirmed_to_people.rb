class AddConfirmedToPeople < ActiveRecord::Migration
  def change
    add_column :people, :confirmed, :boolean, default: false
  end
end
