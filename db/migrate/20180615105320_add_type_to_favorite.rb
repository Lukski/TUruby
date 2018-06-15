class AddTypeToFavorite < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :type, :string
  end
end
