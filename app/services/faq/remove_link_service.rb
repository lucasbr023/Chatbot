module FaqModule
  class RemoveLinkService
    def initialize(params)
      @id = params["id"]
    end

    def call
      begin
         link = Link.find(@id)
       rescue
         return "Link invalido, verifique o Id"
       end
       Link.transaction do
         link.delete
         "Link deletado com sucesso"
       end
    end
  end
end
