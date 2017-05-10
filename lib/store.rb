class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3}
  validates :annual_revenue, numericality: { minimum: 0 }
  validate :must_have_apparel

  before_destroy :check_for_employees

  def must_have_apparel
    if !(mens_apparel) && !(womens_apparel)
      errors.add(:have_apparel, "The store must carry men's or women's apparel.")
    end
  end

  private
    def check_for_employees
      p "--------"
      if employees.any?
        errors[:base] << "cannot delete store that contains employees"
        # return false
        throw :abort
      end
    end

end
