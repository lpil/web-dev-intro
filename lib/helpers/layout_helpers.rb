module LayoutHelpers
  def page_title(page)
    title = page.data[:title]
    if title
      "TODO - #{title}"
    else
      'TODO'
    end
  end
end
