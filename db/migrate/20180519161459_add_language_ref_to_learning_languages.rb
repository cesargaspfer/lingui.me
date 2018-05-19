class AddLanguageRefToLearningLanguages < ActiveRecord::Migration[5.2]
  def change
    change_table :learning_languages do |t|
      t.remove :language
    end
    add_reference :learning_languages, :language, foreign_key: true
  end
end
