class Event < ActiveRecord::Base
 # extend FriendlyId
 # friendly_id :name, use: :slugged
  geocoded_by :address
  after_validation :geocode

  has_many :links
  has_many :user_calendars, :dependent => :destroy
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
  validates :address, presence: true
  validates :content, presence: true
  validate :creation_conditions 
 

  before_save :update_link

  def update_link
    if self.link && ( !self.link.include?('http://') && !self.link.include?('https://') )
      self.link = "http://" + self.link
    end
  end

  def creation_conditions
    errors[:base] << 'Ticket/RSVP link required for Free w/ RSVP events' if (self.rsvp &&  self.link.blank? )
     errors[:base] << 'Invalid link url' if self.link && self.rsvp && !self.link.match(/((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/)
  end 

  def actual_price
    if self.free
      "Free"
    elsif self.rsvp
	"RSVP"
    else
      self.price ? "$ " + self.price.to_s : "Free"
    end
  end 
  
  def no_of_participants
    user_calendars.count 
  end

  def is_top_10?
    Event.all.sort{|event| event.no_of_participants}.reverse[0..9].include?(self)
  end
end
