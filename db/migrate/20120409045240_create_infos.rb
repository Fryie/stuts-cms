class CreateInfos < ActiveRecord::Migration
  def change
    Cms::ContentType.create!(:name => "Info", :group_name => "Info")
    create_content_table :infos, :prefix=>false do |t|
      t.text :content

      t.timestamps
    end
  end
end
