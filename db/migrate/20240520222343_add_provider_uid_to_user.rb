class AddProviderUidToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :uid, :string
  end
end
