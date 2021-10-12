class AddPersonalityToThinker < ActiveRecord::Migration[6.1]
  def change
    add_column :thinkers, :personality, :string
  end
end
