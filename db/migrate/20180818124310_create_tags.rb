class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title
      t.integer :user_id
      t.integer :board_id

      t.timestamps null: false
    end
  end
end
