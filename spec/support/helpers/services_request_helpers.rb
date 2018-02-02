require 'rails_helper'

module ServicesRequestHelpers
  def stub_content_store(base_path, return_value)
    allow(Services.content_store).to receive(:content_item).with(base_path).and_return(return_value)
  end

  def stub_rummager(content_id)
    search_params = params(content_id)
    allow(Services.rummager).to receive(:search).with(search_params).and_return(rummager_results)
  end

  private

  def params(content_id)
    {
      start: 0,
      count: RummagerSearch::PAGE_SIZE_TO_GET_EVERYTHING,
      filter_taxons: [content_id]
    }
  end

  def rummager_results
    {
      "results" => [
        {
          "title" => "A Tagged Content",
          "link" => "/link/to/content",
          "format" => "guide"
        },
        {
          "title" => "Second Tagged Content",
          "link" => "/another/link",
          "format" => "publication"
        }
      ],
      "total" => 2
    }
  end
end
