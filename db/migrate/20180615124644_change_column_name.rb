class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :type, :object_type
  end
end
