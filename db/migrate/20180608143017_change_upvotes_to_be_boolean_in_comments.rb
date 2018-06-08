class ChangeUpvotesToBeBooleanInComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :upvotes, :upvoted
    change_column :comments, :upvoted, :boolean
  end
end
