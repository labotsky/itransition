module StaticPagesHelper
  def best_poems(poems)
    poems.sort{|x,y| y.flaggings.count<=>x.flaggings.count}.take(5)
  end  
end
