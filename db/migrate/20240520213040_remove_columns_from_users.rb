class RemoveColumnsFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :fullname
    remove_column :users, :uid
    remove_column :users, :avatar_url
  end
end
