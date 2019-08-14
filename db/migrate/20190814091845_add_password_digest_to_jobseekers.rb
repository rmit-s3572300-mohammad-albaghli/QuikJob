class AddPasswordDigestToJobseekers < ActiveRecord::Migration[5.1]
  def change
    add_column :jobseekers, :password_digest, :string
  end
end
