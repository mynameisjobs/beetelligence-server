class CreateNexttimeslots < ActiveRecord::Migration[5.2]
  def change
    create_table :nexttimeslots do |t|
      t.integer :store_id
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
