require 'cms/upgrades/v3_4_0'
class UpdateVersionIdColumns < ActiveRecord::Migration
include Cms::Upgrades::V3_4_0::SchemaStatements
  def up
models = %w{info}
models.each do |model_name|
  standardize_version_id_column(model_name)
end
  end

  def down
  end
end
