class CreateThinkers < ActiveRecord::Migration[6.1]
  def change
    create_table :thinkers do |t|
      t.string :name
      t.string :image
      t.integer :times_studied
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
