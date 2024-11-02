class RemoveBooknameToBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :Bookname, :string
  end
end
