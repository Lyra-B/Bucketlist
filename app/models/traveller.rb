class Traveller < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :send_welcome_email

  def send_welcome_email
    Devise::Mailer.welcome(self).deliver_now
  end

  has_many :bucket_list_items
  has_many :activities, :through => :bucket_list_items
  has_many :destinations, :through => :activities

  # accepts_nested_attributes_for :bucket_list_items
  # accepts_nested_attributes_for :activities

end
