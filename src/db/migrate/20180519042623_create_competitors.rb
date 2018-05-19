class CreateCompetitors < ActiveRecord::Migration[5.2]
  def change
    create_table :competitors do |t|
      t.string :imageurl
      t.string :latitude
      t.string :longitude
      t.integer :price
      t.string :source
      t.string :title
      t.string :update_at
      t.string :url
      t.string :user_id

      t.timestamps
    end
  end
end
