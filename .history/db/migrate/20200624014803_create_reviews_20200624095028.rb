class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :restaurant, foreign_key: "restaurant_id"
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
