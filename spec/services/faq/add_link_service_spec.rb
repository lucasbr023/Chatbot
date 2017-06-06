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

    # it "with a link" do
    #   @createService = FaqModule::CreateService.new(
    #                                                 {"question-original" => @question,
    #                                                  "answer-original" => @answer,
    #                                                  "hashtags-original" => @hashtags,
    #                                                  "link-original" => "teste"}
    #                                                  )
    #
    #   response = @createService.call()
    #   expect(Link.last.link).to match("teste")
    # end
  end
end
