class AddMd5ObsoleteToAds < ActiveRecord::Migration
  def change
    add_column :ads, :md5, :string
    add_column :ads, :obsolete, :boolean

    add_index :ads, :obsolete
  end
end
