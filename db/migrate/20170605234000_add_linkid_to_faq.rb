class AddLinkidToFaq < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :faq_id, :integer
  end
end
