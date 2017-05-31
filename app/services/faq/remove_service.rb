module FaqModule
  class RemoveService
    def initialize(params)
      @company = Company.last
      @params = params
      @id = params["id"]
    end

    def call
      faq = @company.faqs.where(id: @id).last
      return "Questão inválida, verifique o Id" if faq == nil

      Faq.transaction do
        faq.hashtag.each do |hashtag|
          if hashtag.faqs.count <= 1
            hashtag.delete
          end
        end
        faq.delete
        "Deletado com sucesso"
      end
    end
  end
end
