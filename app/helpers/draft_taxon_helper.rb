module DraftTaxonHelper
  def draft_taxons
    @draft_taxons ||= all_draft_taxons
  end

  def all_draft_taxons
    taxons = []
    draft_taxon_files.each do |file|
      taxons.push(*JSON.parse(File.read(file)))
    end
    taxons
  end

  def draft_taxon_files
    Dir.glob("#{file_location}/*")
  end

  def file_location
    Rails.root.join("lib", "data", "draft")
  end
end
