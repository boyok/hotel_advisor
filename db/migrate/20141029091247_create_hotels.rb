class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string 	:title
      t.integer :stars_rating
      t.boolean :breakfast_included?
      t.string  :room_description
      t.string 	:photo
      t.integer :price_for_room
      t.string  :country
      t.string	:state
      t.string	:city
      t.string	:street
      t.integer :rating_hotel
      t.integer :user_id
      t.timestamps
    end
    add_index :hotels, [:user_id, :created_at]
  end
end
