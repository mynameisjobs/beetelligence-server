class CreateCompetitorPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :competitor_prices do |t|
      t.string :imageurl
      t.integer :price
      t.string :source
      t.text :title
      t.string :update_at
      t.string :url

      t.timestamps
    end
  end
end
