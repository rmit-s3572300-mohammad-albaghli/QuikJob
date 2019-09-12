class AddDescriptionToJobseekers < ActiveRecord::Migration[5.1]
  def change
    add_column :jobseekers, :description, :string
  end
end
