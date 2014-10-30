class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string 	:title
      t.integer :stars_rating
      t.string :breakfast_included
      t.string  :room_description
      #t.string 	:photo
      t.integer :price_for_room
      t.integer :rating_hotel
      t.integer :user_id
      t.timestamps
    end
    add_index :hotels, [:user_id, :created_at]
    add_column :hotels, :photo, :string
  end
end
