# frozen_string_literal: true

class MeetingsController < ApplicationController
  before_action :set_meeting, only: :show

  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to meetings_path
    else
      render 'new'
    end
  end

  def show; end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting)
          .permit(:title, :description, :address, :started_at, :duration)
  end
end
