class Taxons

  def initialize
  end

  def level_one_taxons
    live_taxons = Services.content_store.content_item("/").dig("links", "level_one_taxons")
    transport_taxon = {}
    Services.read_taxon_document.each do |taxon|
      if taxon[:parent_taxons].blank?
        transport_taxon = taxon
        break
      end
    end
    live_taxons.push(transport_taxon)
  end
end
