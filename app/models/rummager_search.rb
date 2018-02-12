class RummagerSearch
  PAGE_SIZE_TO_GET_EVERYTHING = 1000

  attr_reader :content_id, :document_type

  def initialize(content_id, document_type = nil)
    @content_id = content_id
    @document_type = document_type
  end

  def search_results
    @search_results = rummager_search["results"]
  end

  def search_results_count
    @results_count = rummager_search["total"]
  end

  private

  def rummager_search
    @rummager_results ||= Services.rummager.search(search_params)
  end

  def search_params
    params = {
      start: 0,
      count: PAGE_SIZE_TO_GET_EVERYTHING,
      filter_taxons: [content_id]
    }

    params.merge!({ filter_format: [document_type] }) if document_type.present?

    params
  end
end
