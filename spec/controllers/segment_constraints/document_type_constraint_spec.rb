require 'rails_helper'

RSpec.describe DocumentTypeConstraint, type: :routing do
  describe "#match?" do
    let(:request) { double("request") }

    context "when request has correct params" do
      before :each do
        allow(request).to receive(:path_parameters).and_return({
          :path => "education",
          :document_type => "publication"
        })
      end

      it "should return true" do
        expect(described_class.new.matches?(request)).to be_truthy
      end
    end

    context "when request has incorrect params" do
      before :each do
        allow(request).to receive(:path_parameters).and_return({
          :path => "education",
          :document_type => "not_a_doc_type"
        })
      end

      it "should return false" do
        expect(described_class.new.matches?(request)).to be_falsey
      end
    end
  end
end