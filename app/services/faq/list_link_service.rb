module FaqModule
  class ListLinkService
    def initialize(params)
      @id = params["id-original"]
    end

    def listLinksFromFaq
      faq = Faq.find(@id)
      links = faq.links
      if links.count > 0
        response = "Segue os links referentes a questão: #{faq.question} \n\n"
        links.each do |link|
          response += "* Id: #{link.id} - #{link.link}"
        end
      end
      (links.count > 0)? response : "Nada encontrado"
    end
  end
end
