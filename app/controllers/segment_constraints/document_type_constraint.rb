class DocumentTypeConstraint
  def initialize
    @doc_types = YAML.load_file(Rails.root.join("lib", "data", "formats.yml"))
  end

  def matches?(request)
    @doc_types.include?(request.path_parameters[:document_type])
  end
end


