class CreateLearningLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :learning_languages do |t|
      t.references :user, foreign_key: true
      t.string :language

      t.timestamps
    end
  end
end
