class Reservation < ApplicationRecord
    belongs_to :room
    belongs_to :user

    validates :check_in,presence: true
    validates :check_out,presence: true
    validates :number_of_people,presence: true,numericality: { only_integer: true,greater_than: 0 }
    validates :user_id,presence: true
    validates :room_id,presence: true
    validate :datecheck
    def datecheck
      if check_in == nil || check_out == nil
      elsif self.check_in >= self.check_out 
      errors.add(:check_out, "はチェックイン以降の日付で登録してください。") 
      elsif self.check_in <= Date.today
      errors.add(:check_in, "は本日以降の日付で登録してください。") 
      end
    end

end
