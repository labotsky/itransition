module StaticPagesHelper
  def best_poems(poems)
    poems.sort{|x,y| y.flaggings.size<=>x.flaggings.size}.take(5)
  end  
end
