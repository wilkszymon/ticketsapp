class AddStatusToTicket < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :status_id, :int
  end
end
