# frozen_string_literal: true

class Meeting < ApplicationRecord
  before_save :set_finished_at, if: :will_save_change_to_duration?

  has_one_attached :preview_image

  def set_finished_at
    self.finished_at = started_at + duration.minutes
  end
end
