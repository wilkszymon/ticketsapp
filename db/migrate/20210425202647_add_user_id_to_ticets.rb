class AddUserIdToTicets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :user_id, :int
  end
end
