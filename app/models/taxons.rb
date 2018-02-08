class Taxons
  def initialize
  end

  def level_one_taxons
    Services.content_store.content_item('/').dig('links', 'level_one_taxons')
  end
end
