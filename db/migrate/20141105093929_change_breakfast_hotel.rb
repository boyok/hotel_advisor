class ChangeBreakfastHotel < ActiveRecord::Migration
  def change
  	change_column :hotels, :breakfast_included, :boolean
  end
end
