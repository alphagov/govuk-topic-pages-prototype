require 'rails_helper'
require 'gds_api/test_helpers/rummager'

module ServicesRequestHelpers
  include GdsApi::TestHelpers::Rummager
  
  def stub_content_store(base_path, return_value)
    allow(Services.content_store).to receive(:content_item).with(base_path).and_return(return_value)
  end

  def stub_rummager
    allow(Services.rummager).to receive(:search).and_return(rummager_results)
  end

  private

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
