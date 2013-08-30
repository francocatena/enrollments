class AddWithNotebookToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :with_notebook, :boolean, default: false
  end
end
