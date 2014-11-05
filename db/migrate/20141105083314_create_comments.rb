class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text_comment
      t.integer :hotel_id
      t.integer :hotel_rating
      t.integer :user_id

      t.timestamps
    end
  end
end
