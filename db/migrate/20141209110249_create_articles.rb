class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :category
      t.string :title
      t.string :name
      t.integer :price
      t.string :address
      t.string :email
      t.text :body

      t.timestamps
    end
  end
end
