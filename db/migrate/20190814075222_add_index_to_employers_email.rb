class AddIndexToEmployersEmail < ActiveRecord::Migration[5.1]
  # Required to make employers' email unique
  def change
    add_index :employers, :email, unique: true
  end
end
