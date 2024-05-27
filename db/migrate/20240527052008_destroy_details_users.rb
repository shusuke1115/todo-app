class DestroyDetailsUsers < ActiveRecord::Migration[6.1]
  def change
    drop_table :detail_users
  end
end
