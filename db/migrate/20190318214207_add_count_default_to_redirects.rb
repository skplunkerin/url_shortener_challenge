class AddCountDefaultToRedirects < ActiveRecord::Migration[5.2]
  def change
    change_column :redirects, :count, :integer, default: 0
  end
end
