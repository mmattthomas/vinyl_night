class AddBannerUrlToEventModel < ActiveRecord::Migration
  def change
    add_column :events, :banner_url, :string
  end
end
