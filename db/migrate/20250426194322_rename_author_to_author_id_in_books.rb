class RenameAuthorToAuthorIdInBooks < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :books, :authors
  end
end
