class AddLanguageRefToMotherLanguages < ActiveRecord::Migration[5.2]
  def change
    change_table :mother_languages do |t|
      t.remove :language
    end
    add_reference :mother_languages, :language, foreign_key: true
  end
end
