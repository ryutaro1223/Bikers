class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :post_name
      t.string :image_id
      t.references :user, foreign_key: true
      t.text :caption
      t.integer :user_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
