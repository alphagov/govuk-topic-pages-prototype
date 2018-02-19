require 'gds_api/content_store'
require 'gds_api/rummager'

module Services
  DOCUMENT_FORMATS_YAML = "https://raw.githubusercontent.com/alphagov/rummager/master/config/govuk_index/migrated_formats.yaml".freeze

  def self.content_store
    @content_store ||= GdsApi::ContentStore.new(Plek.new.find("content-store"))
  end

  def self.rummager
    @rummager ||= GdsApi::Rummager.new(Plek.new.find("search"), verify_ssl: false)
  end

  def self.document_formats
    document_formats_yaml_file = open(DOCUMENT_FORMATS_YAML) {|f| f.read}
    document_formats_yaml_data = YAML::load(document_formats_yaml_file)
  end
end
