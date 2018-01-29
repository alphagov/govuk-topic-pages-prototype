class TopicsController < ApplicationController
  def index
    @level_one_taxons = Taxons.new.level_one_taxons
  end

  def show
    @taxon = Taxon.new(params[:path])
    @tagged_content = RummagerSearch.new(@taxon.content_id).search_results
  end
end
