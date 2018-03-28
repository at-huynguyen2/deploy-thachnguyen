class UploadImageTeams < ActiveRecord::Migration[5.0]

  def self.up
    add_column :teams, :image_file_name, :string
    add_column :teams, :image_content_type, :string
    add_column :teams, :image_file_size, :integer
  end

  def self.down
    remove_column :teams, :image_file_name
    remove_column :teams, :image_content_type
    remove_column :teams, :image_file_size
  end

end
