class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      
      t.string :name
      t.string :emailid
      t.text :description
      t.date :cdate
      

      t.timestamps null: false
    end
  end
end
