require 'rails_helper'
require 'gds_api/test_helpers/rummager'

module ServicesRequestHelpers
  include GdsApi::TestHelpers::Rummager

  def stub_rummager
    allow(Services.rummager).to receive(:search_enum).and_return(rummager_results)
  end

  private

  def rummager_results
    [
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
    ]
  end
end
