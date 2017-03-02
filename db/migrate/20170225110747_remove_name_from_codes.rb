class RemoveNameFromCodes < ActiveRecord::Migration
  def change
    remove_column :codes, :name, :string
  end
end
