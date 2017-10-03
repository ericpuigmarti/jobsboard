class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :url
      t.string :city
      t.string :country
      
      t.timestamps :post_time
    end
  end
end
