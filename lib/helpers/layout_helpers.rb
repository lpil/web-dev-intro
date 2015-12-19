module LayoutHelpers
  def page_title(data, page)
    attrs = data.tutorials[page.url]
    if attrs && attrs['title']
      "TODO - #{attrs['title']}"
    else
      'TODO'
    end
  end
end
