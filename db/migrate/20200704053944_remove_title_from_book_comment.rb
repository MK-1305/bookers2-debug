class RemoveTitleFromBookComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :book_comments, :title, :string
  end
end
