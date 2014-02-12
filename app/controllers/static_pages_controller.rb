class StaticPagesController < ApplicationController
  def home
    @events_collection = Hash.new
    start_date = Date.parse('03/07/2014')
    end_date = Date.parse('03/16/2014')

    (start_date...end_date).each do |event_date|
      @events_collection[event_date] = Array.new if Event.where(date: event_date).count > 0
      Event.where(date: event_date).order('tstart').each do |event|
        @events_collection[event_date].push event
      end
    end
  end

  def help
  end
  
  def about
  end

  def contact
  end
end
