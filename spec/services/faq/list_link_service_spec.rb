require_relative './../../spec_helper.rb'

describe FaqModule::ListLinkService do
  before do
    @company = create(:company)
    @question = FFaker::Lorem.sentence
    @answer = FFaker::Lorem.sentence
    @hashtags = "#{FFaker::Lorem.word}, #{FFaker::Lorem.word}"
    @faq = create(:faq)
    @link = "www.#{FFaker::Lorem.word}.com.br"
  end

  describe '#call' do
    it "Faq with zero links, expect nothing" do
      #add a Question
      @createService = FaqModule::CreateService.new({"question-original" => @question, "answer-original" => @answer, "hashtags-original" => @hashtags})
      @createService.call()
      @listService = FaqModule::ListLinkService.new({"id-original" => Faq.last.id})

      response = @listService.listLinksFromFaq()
      expect(response).to match("Nada encontrado")
    end

    it "list links of a Faq" do
      #add a Question
      @createService = FaqModule::CreateService.new({"question-original" => @question, "answer-original" => @answer, "hashtags-original" => @hashtags})
      @createService.call()
      @listService = FaqModule::ListLinkService.new({"id-original" => Faq.last.id})
      @createService = FaqModule::AddLinkService.new({"link-original" => @link, "id-original" => Faq.last.id})
      @createService.addLink()
      response = @listService.listLinksFromFaq()
      #add a Link

      expect(response).to match(Faq.last.links.last.link)

    end
  end
end
