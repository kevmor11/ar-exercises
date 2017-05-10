class Employee < ActiveRecord::Base

  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_inclusion_of :hourly_rate, :in => 40..200
  validates :store_id, presence: true

  after_create :password_create

  private
    def password_create
      self.password = (0...8).map { ('a'..'z').to_a[rand(26)] }.join
      self.save
    end

end
