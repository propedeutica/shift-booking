######################################################
# Class Room
# Rooms available, with capacity
######################################################
class Room < ApplicationRecord
  has_many  :shifts, dependent: :destroy
  validates :name, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def self.to_csv
    attributes = %w[id name capacity created_at updated_at]

    CSV.generate do |csv|
      csv << attributes
      all.each do |room|
        csv << attributes.map { |attr| room.send(attr) }
      end
    end
  end

  def total_capacity
    shifts.count * capacity
  end

  def total_sites_available
    tsitesavailable = 0
    shifts.each do |x|
      tsitesavailable += x.sites_available
    end
    tsitesavailable
  end

  def total_occupied
    total_capacity - total_sites_available
  end
end
