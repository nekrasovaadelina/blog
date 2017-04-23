class CreateAskArticles < ActiveRecord::Migration
  def change
    create_table :ask_articles do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
