class AddCatalogToCompetitors < ActiveRecord::Migration[5.2]
  def change
    add_column :competitors, :catalog, :string, :default => ""
  end
end