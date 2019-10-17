class AddPdfToJobseekers < ActiveRecord::Migration[5.1]
  def change
    add_column :jobseekers, :pdf, :string
  end
end
