class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :title
      t.text :brief
      t.string :chart
      t.string :audio
      t.text :lyrics
      t.integer :user_id
      
      t.timestamps
    end
  end
end