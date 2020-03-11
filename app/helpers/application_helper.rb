module ApplicationHelper

  def raffle_selector
    Raffle.all.collect{ |r| [r.name, r.id] }
  end

end
