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

  def draft_taxons
    taxons = []
    draft_taxon_files.each do |file|
      taxons.push(*JSON.parse(File.read(file)))
    end
    taxons
  end

  def draft_taxon_files
    location = Rails.root.join("lib", "data")
    Dir.glob("#{location}/*")
  end

  def base_path
    "/#{@base_path}"
  end
end
