module FaqModule
  class AddLinkService
    def initialize(params)
      @link = params["link-original"]
      @id = params["id-original"]
    end

    def addLink
      begin
        Link.transaction do
          if @link != nil && @link != "" && @id != 0 && @id != nil
            faq = Faq.find(@id)
            if faq != nil
              Link.create(link: @link, faq: faq)
            end
          end
        end
        "Link adicionado com sucesso"
      rescue
        "Problema ao adicionar Link"
      end
    end
  end
end
