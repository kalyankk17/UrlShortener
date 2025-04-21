class AddVisitCountToTinyUrls < ActiveRecord::Migration[7.0]
  def change
    add_column :tiny_urls, :visit_count, :integer, default: 0, null: false
  end
end
