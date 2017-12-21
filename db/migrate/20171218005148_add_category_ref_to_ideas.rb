class AddCategoryRefToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_reference :ideas, :category, foreign_key: true, on_delete: :cascade
  end
end
