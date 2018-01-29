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

  private

  def content_item
    @content_item ||= Services.content_store.content_item(base_path)
  end

  def base_path
    "/#{@base_path}"
  end
end
