class AddIdentificationToPeople < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.string :identification
    end
  end
end
