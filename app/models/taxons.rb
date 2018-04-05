class Taxons
  include DraftTaxonHelper

  def initialize
  end

  def level_one_taxons
    taxons = live_level_one_taxons + draft_level_one_taxons
    taxons.sort_by! { |taxon| taxon["title"] }
  end

  private

  def live_level_one_taxons
    Services.content_store.content_item('/').dig('links', 'level_one_taxons') || []
  end

  def draft_level_one_taxons
    draft_taxons.keep_if { |taxon| level_one_taxon?(taxon) }
  end

  def level_one_taxon?(taxon)
    taxon["links"]["parent_taxons"].blank?
  end
end
