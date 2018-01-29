class TopicsController < ApplicationController
  def index
    @level_one_taxons = Taxons.new.level_one_taxons
  end
end
