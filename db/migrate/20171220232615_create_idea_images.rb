class CreateIdeaImages < ActiveRecord::Migration[5.1]
  def change
    create_join_table(:ideas, :images) do |t|
      t.index :idea_id
      t.index :image_id
    end
  end
end
