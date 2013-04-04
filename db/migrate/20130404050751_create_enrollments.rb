class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.text :comment
      t.references :person, index: true, null: false
      t.references :course, index: true, null: false

      t.timestamps
    end
  end
end
