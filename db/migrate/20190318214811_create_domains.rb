class CreateDomains < ActiveRecord::Migration[5.2]
  def change
    create_table :domains do |t|
      t.string    :base_domain    # "i.e. https://example.com"

      t.timestamps
    end
    # Add relationship
    add_column    :redirects,   :domain_id, :integer
  end
end
