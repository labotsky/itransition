module ApplicationHelper
  def cp(path)
    "active" if current_page?(path)
  end

  def theme(t)
    if cookies[:theme] == t
      'disabled'
    end  
  end
end
