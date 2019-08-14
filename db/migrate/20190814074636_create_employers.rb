class CreateEmployers < ActiveRecord::Migration[5.1]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :email
      t.string :info

      t.timestamps
    end
  end
end
