class AddReferencesToFollows < ActiveRecord::Migration[7.1]
  def change
    add_reference :follows, :follower, foreign_key: { to_table: :users }
    add_reference :follows, :followee, foreign_key: { to_table: :users }
  end
end
