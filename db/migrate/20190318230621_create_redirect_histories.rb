class CreateRedirectHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :redirect_histories do |t|
      t.integer     :redirect_id
      t.string      :notes

      t.timestamps
    end
    remove_column   :redirects,   :count,   :integer,   default: 0
  end
end
