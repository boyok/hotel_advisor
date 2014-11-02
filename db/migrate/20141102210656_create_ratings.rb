class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :hotel_id
      t.integer :rating_hotel_by_user

      t.timestamps
    end
  end
end
