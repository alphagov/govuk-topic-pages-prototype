require 'gds_api/content_store'
require 'gds_api/rummager'

module Services
  def self.content_store
    @content_store ||= GdsApi::ContentStore.new(Plek.new.find("content-store"))
  end

  def self.root_taxons
    @root_taxons ||= YAML.load_file(Rails.root.join("lib", "data", "root_taxons.yml"))
  end

  def self.rummager
    @rummager ||= GdsApi::Rummager.new(Plek.new.find("search"), verify_ssl: false)
  end
end
