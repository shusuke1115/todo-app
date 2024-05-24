class AddColumnImage < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :user_image, :string
  end
end
