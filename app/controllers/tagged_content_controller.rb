class TaggedContentController < ApplicationController
  def show
    @taxon = Taxon.new(params[:path])
    @tagged_content = RummagerSearch.new(@taxon.content_id, params[:document_type])
  end
end
