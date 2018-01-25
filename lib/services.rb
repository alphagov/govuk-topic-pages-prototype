require 'gds_api/content_store'

module Services
  def self.root_taxons
    @root_taxons ||= YAML.load_file(Rails.root.join("lib", "data", "root_taxons.yml"))
  end
end
