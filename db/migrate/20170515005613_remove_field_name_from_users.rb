class RemoveFieldNameFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :usuarios, :password, :string
  end
end
