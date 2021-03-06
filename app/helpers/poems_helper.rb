module PoemsHelper
  def toggle_like_button(poem, user)
    if user.flagged?(poem, :like)
      link_to like_poem_path(poem), remote: true do
        '<i class="icon-thumbs-down"></i>'.html_safe  
      end
    else
      link_to like_poem_path(poem), remote: true do
        '<i class="icon-thumbs-up"></i>'.html_safe
      end    
    end
  end

  def poem_chart_data
    (2.weeks.ago.to_date..Date.today).map do |date|
      {
        date: date,
        total: Poem.where("date(created_at) < ?", date).count
      }
    end  
  end
end
