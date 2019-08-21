class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :info
      t.text :requirements
      t.references :employer, foreign_key: true

      t.timestamps
    end
    add_index :jobs, [:employer_id, :created_at]
  end
end
