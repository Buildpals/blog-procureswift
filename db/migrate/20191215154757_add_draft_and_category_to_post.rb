
class AddDraftAndCategoryToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :draft, :boolean, default: true
    add_column :posts, :catergory, :integer
  end
end
