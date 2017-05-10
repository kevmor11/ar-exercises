class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3}
  validates :annual_revenue, numericality: { minimum: 0 }
  validate :must_have_apparel

  def must_have_apparel
    if !(mens_apparel) && !(womens_apparel)
      errors.add(:have_apparel, "The store must carry men's or women's apparel.")
    end
  end

end
