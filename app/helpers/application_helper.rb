# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_modal(name, url, id, title)
    "<a href=\"/#{url}/#{id}\" title=\"#{title}\" onclick=\"Modalbox.show(this.href, {title: this.title}); return false;\">#{name}</a>"
  end
end

