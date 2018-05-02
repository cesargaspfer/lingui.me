class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :upvotes
      t.references :user, foreign_key: true
      t.integer :difficulty
      t.string :learning_language
      t.string :mother_language
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
