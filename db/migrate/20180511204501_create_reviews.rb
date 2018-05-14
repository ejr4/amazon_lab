class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :rating
      t.belongs_to :product, foreign_key: true, index: true 

      t.timestamps
    end
  end
end
