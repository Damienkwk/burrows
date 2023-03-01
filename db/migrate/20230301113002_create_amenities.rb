class CreateAmenities < ActiveRecord::Migration[7.0]
  def change
    create_table :amenities do |t|
      t.integer :name
      t.integer :category

      t.timestamps
    end
  end
end
