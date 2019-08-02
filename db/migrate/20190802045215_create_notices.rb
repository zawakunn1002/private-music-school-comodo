class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.integer :user_id
      t.integer :admin_id
      t.string :notice_title
      t.text :notice_text
      t.integer :favorites_count

      t.timestamps
    end
  end
end
