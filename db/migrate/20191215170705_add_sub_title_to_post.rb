class AddSubTitleToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :sub_title, :string
  end
end
