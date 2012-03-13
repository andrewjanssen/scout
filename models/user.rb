class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :email

  # metadata on user delivery preferences
  field :delivery, :type => Hash
  #   mechanism: ['email']
  #   email_frequency: ['daily']

  has_many :subscriptions
  has_many :interests
  
  validates_presence_of :email
  validates_uniqueness_of :email


  # used for rendering admin emails
  def to_admin
    "[#{email}][#{mechanism}][#{frequency}]"
  end

  def mechanism
    delivery['mechanism']
  end

  def frequency
    mechanism == 'email' ? delivery['email_frequency'] : ""
  end
end