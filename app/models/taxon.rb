class Taxon

  def initialize(base_path)
    @base_path = base_path
  end

  def title
    content_item["title"]
  end

  def child_taxons
    content_item.dig("links", "child_taxons")
  end

  def children?
    child_taxons.present?
  end

  def content_id
    content_item["content_id"]
  end

  def tagged_content_count(content_id)
    RummagerSearch.new(content_id).search_results_count
  end

  private

  def content_item
    @content_item ||= Services.content_store.content_item(base_path)
  rescue GdsApi::ContentStore::ItemNotFound
    @content_item ||= draft_taxon
  end

  def draft_taxon
    Services.read_taxon_document.each do |taxon|
      return taxon if taxon["base_path"] == base_path
    end
  end

  def base_path
    "/#{@base_path}"
  end
end
