require 'csv'
class AddInitialSkills < ActiveRecord::Migration[5.1]
  
  def up
    
    
    CSV.foreach("public/TestUpload.csv", :headers => true) do |row|
      Skill.create!(row.to_hash)
    end
    
    Skill.create(name: "Example name")
    
  end
  
  def down
    
  end 
end
