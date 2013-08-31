module ApplicationHelper
  def cp(path)
    "active" if current_page?(path)
  end

  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / Integer(max.count) * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end
  
  def page_title(name)
      content_for(:title){"| #{name}"}
  end
end
