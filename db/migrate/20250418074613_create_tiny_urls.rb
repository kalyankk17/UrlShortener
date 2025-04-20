class CreateTinyUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :tiny_urls do |t|
      t.string :long_url
      t.string :short_url
      t.string :session_id
      t.datetime :expired_at

      t.timestamps
    end
  end
end
