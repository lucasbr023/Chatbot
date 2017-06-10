class InterpretService
  def self.call action, params
   case action
   when "list", "search", "search_by_hashtag"
     FaqModule::ListService.new(params, action).call()
   when "create"
     FaqModule::CreateService.new(params).call()
   when "remove"
     FaqModule::RemoveService.new(params).call()
   when "help"
     HelpService.call
   when "add_link"
     FaqModule::AddLinkService.new(params).addLink()
   when "remove_link"
     FaqModule::RemoveLinkService.new(params).call()
   when "list_link"
     FaqModule::ListLinkService.new(params).listLinksFromFaq()
   else
     "Não compreendi o seu desejo"
   end
 end
end
