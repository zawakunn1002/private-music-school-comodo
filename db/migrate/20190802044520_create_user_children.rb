class CreateUserChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :user_children do |t|
      t.string :name_kanji_sei
      t.string :name_kanji_mei
      t.string :name_kana_sei
      t.string :name_kana_mei
      t.integer :user_id

      t.timestamps
    end
  end
end
