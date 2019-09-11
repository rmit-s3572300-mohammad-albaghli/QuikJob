class AddRememberDigestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :jobseekers, :remember_digest, :string
    add_column :employers, :remember_digest, :string
  end
end
