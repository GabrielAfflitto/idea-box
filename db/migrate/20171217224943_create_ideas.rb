class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.text :description
      t.references :user, foreign_key: true
    end
  end
end
