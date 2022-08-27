# frozen_string_literal: true

class Meeting < ApplicationRecord
  before_create :set_finished_at, unless: :finished_at?

  def set_finished_at
    self.finished_at = started_at + duration.minutes
  end
end
