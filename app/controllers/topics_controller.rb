class TopicsController < ApplicationController
  def index
    @level_one_taxons = Services.root_taxons
  end
end
