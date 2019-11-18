class CreateDreams < ActiveRecord::Migration[5.2]
  def change
    create_table :dreams do |t|
      t.string :title
      t.text :description
      t.string :vibe
      t.string :duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
