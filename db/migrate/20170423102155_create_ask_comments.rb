class CreateAskComments < ActiveRecord::Migration
  def change
    create_table :ask_comments do |t|
      t.text :text, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.references :ask_article, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
