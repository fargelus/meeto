# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = KudagoAPI.new.fetch_events
  end
end
