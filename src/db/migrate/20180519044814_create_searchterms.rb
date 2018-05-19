class CreateSearchterms < ActiveRecord::Migration[5.2]
  def change
    create_table :searchterms do |t|
      t.string :user_id
      t.string :search_term

      t.timestamps
    end
  end
end
