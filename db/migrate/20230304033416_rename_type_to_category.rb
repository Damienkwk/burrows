class RenameTypeToCategory < ActiveRecord::Migration[7.0]
  def change
    rename_column :beds, :type, :category
  end
end
