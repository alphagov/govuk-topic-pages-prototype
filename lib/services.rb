require 'gds_api/content_store'
require 'gds_api/rummager'

module Services
  def self.content_store
    @content_store ||= GdsApi::ContentStore.new(Plek.new.find("content-store"))
  end

  def self.rummager
    @rummager ||= GdsApi::Rummager.new(Plek.new.find("search"), verify_ssl: false)
  end

  def self.read_taxon_document
    @taxon ||= JSON.parse(File.read(Rails.root.join("lib", "data", "transport.json")))
  end
end
