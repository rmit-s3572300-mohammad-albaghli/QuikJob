class AddPasswordDigestToEmployers < ActiveRecord::Migration[5.1]
  def change
    add_column :employers, :password_digest, :string
  end
end
