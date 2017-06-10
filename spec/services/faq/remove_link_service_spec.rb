require_relative './../../spec_helper.rb'

describe FaqModule::RemoveLinkService do
  before do
    @link = create(:link)
    @faq = create(:faq)
  end

  describe '#call' do
    it "With valid Id, remove Link" do

      @removeService = FaqModule::RemoveLinkService.new({"id" => @link.id})
      response = @removeService.call()

      expect(response).to match("Link deletado com sucesso")
    end

    it "With invalid ID, receive error message" do
      @removeService = FaqModule::RemoveLinkService.new({"id" => rand(1..9999)})
      response = @removeService.call()

      expect(response).to match("Link invalido, verifique o Id")
    end
  end
end
