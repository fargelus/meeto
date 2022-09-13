# frozen_string_literal: true

class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show edit update destroy]

  def index
    @meetings = Meeting.order(:id)
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

  def edit; end

  def update
    if @meeting.update(meeting_params)
      @meeting.preview_image.attach(image_from_params) if image_from_params
      redirect_to meetings_path
    else
      render 'edit'
    end
  end

  def destroy
    @meeting.delete
    redirect_to meetings_path
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def image_from_params
    params[:meeting][:preview_image]
  end

  def meeting_params
    params.require(:meeting).permit(:title, :description, :address, :started_at,
                                    :duration, :latitude, :longitude, :participants_limit)
  end
end
