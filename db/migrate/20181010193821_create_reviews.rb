class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.float :score
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end
  end
end
