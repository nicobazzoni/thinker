class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.string :quote
      t.integer :likes

      t.timestamps
    end
  end
end
