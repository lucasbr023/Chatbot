require_relative './../../spec_helper.rb'

describe FaqModule::AddLinkService do
  before do
    @faq = create(:faq)
    @link = "www.#{FFaker::Lorem.word}.com.br"
  end

  describe '#call' do
    it "with a link" do
      @createService = FaqModule::AddLinkService.new({"link-original" => @link, "id-original" => @faq.id})
      response = @createService.addLink()
      expect(Link.last.link).to match(@link)
    end

    it "Add two link to same question" do
      @createService = FaqModule::AddLinkService.new({"link-original" => @link, "id-original" => @faq.id})
      response = @createService.addLink()
      response = @createService.addLink()
      expect(Faq.last.links.count).to match(2)
    end
  end
end
