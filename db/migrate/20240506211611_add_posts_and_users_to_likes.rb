class AddPostsAndUsersToLikes < ActiveRecord::Migration[7.1]
  def change
    add_reference :likes, :post, foreign_key: true
    add_reference :likes, :user, foreign_key: true
  end
end
