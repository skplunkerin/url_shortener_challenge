class CreateRedirects < ActiveRecord::Migration[5.2]
  def change
    create_table :redirects do |t|
      t.string    :full_url
      t.string    :short_url
      t.integer   :count

      t.timestamps
    end
  end
end
