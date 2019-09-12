class AddAvailableToJob < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :available, :boolean
  end
end
