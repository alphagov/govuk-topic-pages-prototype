class Taxon
  include DraftTaxonHelper

  def initialize(base_path)
    @base_path = base_path
  end

  def title
    content_item["title"]
  end

  def description
    content_item["description"]
  end

  def child_taxons
    children = content_item.dig("links", "child_taxons")
    if children.present?
      children.sort_by { |t| t["title"] }
    end
  end

  def children?
    child_taxons.present?
  end

  def content_id
    content_item["content_id"]
  end

  def root_taxon
    parent_taxons = content_item.dig("links", "parent_taxons")
    if parent_taxons.present?
      parent_taxons.first
    end
  end

  def tagged_content_count(content_id)
    RummagerSearch.new(content_id).search_results_count
  end

  def base_path
    "/#{@base_path}"
  end

  private

  def content_item
    @content_item ||= begin
                        Services.content_store.content_item(base_path)
                      rescue GdsApi::ContentStore::ItemNotFound
                        draft_taxon
                      end
  end

  def draft_taxon
    draft_taxons.each do |taxon|
      return taxon if taxon["base_path"] == base_path
    end
  end
end
