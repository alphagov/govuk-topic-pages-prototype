class Taxons
  def initialize
  end

  def level_one_taxons
    live_level_one_taxons.push(draft_level_one_taxons)
  end

  private

  def live_level_one_taxons
    Services.content_store.content_item('/').dig('links', 'level_one_taxons') || []
  end

  def draft_level_one_taxons
    draft_taxons.map do |taxon|
      return taxon if taxon["links"]["parent_taxon"].blank?
    end
  end

  def draft_taxons
    @taxon ||= JSON.parse(File.read(Rails.root.join("lib", "data", "draft", "transport.json")))
  end
end
