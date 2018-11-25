class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :title
      t.string :sheet_music
      t.string :audio_file
      t.text :lyric_idea
      t.text :description
      t.integer :user_id
      
      t.timestamps
    end
  end
end