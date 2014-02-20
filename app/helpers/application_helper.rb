module ApplicationHelper
	def full_title(page_title)
		base_title = "Unofficial SXSW Drectory"
		if page_title.empty? 
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
  def event_class(event)
    event_classes = Array.new
    event_classes.push 'all'
    event_classes.push 'free' if event.free
    event_classes.push 'free' if event.rsvp
    event_classes.push 'rsvp' if event.rsvp
    event_classes.push 'paid' if event.price
    event_classes.push 'drink' if event.drinks

    event_classes.uniq.join(" ")
  end

  def events_collection_class(event_list)
    event_classes = Array.new
    event_classes.push 'all_date'

    event_list.each do |event|
      event_classes.push 'free' if event.free
      event_classes.push 'free' if event.rsvp
      event_classes.push 'rsvp' if event.rsvp
      event_classes.push 'paid' if event.price
      event_classes.push 'drink' if event.drinks
    end
    
    event_classes.uniq.join(" ")
  end

  def calendar_starting_date
    scheduled_date = Date.parse('03/07/2014')
    calendar_date = scheduled_date < Date.today ? Date.today : scheduled_date
    calendar_date.strftime('%m/%d/%Y') 
  end

  def confirm_deletion(event)
    if event.date > Date.today
      "return confirm_delete();"
    else
      "return true;"
    end
  end
end
