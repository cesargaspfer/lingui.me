class AddLanguageRefToLearningLanguages < ActiveRecord::Migration[5.2]
  def change
    remove_column :learning_languages, :language
    add_reference :learning_languages, :language, index: true, foreign_key: true
  end
end
