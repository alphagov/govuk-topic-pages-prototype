class TopicsController < ApplicationController
  def index
    @level_one_taxons = Taxons.new.level_one_taxons
  end

  def show
    @taxon = Taxon.new(params[:path])
  end
end
