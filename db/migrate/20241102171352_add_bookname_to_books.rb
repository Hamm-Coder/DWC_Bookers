class AddBooknameToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :Bookname, :string
  end
end
