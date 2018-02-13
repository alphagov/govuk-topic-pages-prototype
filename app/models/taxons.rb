class Taxons
  def initialize
  end

  def level_one_taxons
    live_level_one_taxons + draft_level_one_taxons
  end

  private

  def live_level_one_taxons
    Services.content_store.content_item('/').dig('links', 'level_one_taxons') || []
  end

  def draft_level_one_taxons
    draft_taxons.keep_if { |taxon| level_one_taxon?(taxon) }
  end

  def draft_taxons
    taxons = []
    draft_taxon_files.each do |file|
      taxons.push(*JSON.parse(File.read(file)))
    end
    taxons
  end

  def level_one_taxon?(taxon)
    taxon["links"]["parent_taxons"].blank?
  end

  def draft_taxon_files
    location = Rails.root.join("lib", "data", "draft")
    Dir.glob("#{location}/*")
  end
end
