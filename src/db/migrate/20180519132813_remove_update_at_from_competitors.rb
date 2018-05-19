class RemoveUpdateAtFromCompetitors < ActiveRecord::Migration[5.2]
  def up
    remove_column :competitors, :update_at
  end
end
