class CatRentalRequest < ApplicationRecord
  STATUS_STATES = %w(PENDING APPROVED DENIED)

  after_initialize :assign_default_status


  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate
  validate :start_must_come_before_end
  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat


  def assign_default_status
    self.status ||= "PENDING"
  end

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: cat_id)
      .where(<<-SQL, start_date, end_date)
        NOT((? > end_date) OR (? < start_date))
      SQL
  end

  def overlapping_approved_requests
  overlapping_requests.where("status = 'APPROVED'")
  end

  def overlapping_pending_requests
   overlapping_requests.where("status = 'PENDING'")
  end

  def start_must_come_before_end
    return if start_date < end_date
    errors[:start_date] << "must come before end date"
    errors[:end_date] << "must come after start date"
  end
end
