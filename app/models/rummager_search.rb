class RummagerSearch
  PAGE_SIZE_TO_GET_EVERYTHING = 1000

  attr_reader :content_id

  def initialize(content_id)
    @content_id = content_id
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
    {
      start: 0,
      count: PAGE_SIZE_TO_GET_EVERYTHING,
      filter_taxons: [content_id]
    }
  end
end
