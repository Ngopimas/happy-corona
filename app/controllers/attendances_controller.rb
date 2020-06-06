class AttendancesController < ApplicationController
  before_action :user_signed_in?

  def create
    @attendance = Attendance.new
    @attendance.event = Event.find(params[:event_id])
    @attendance.user_id = current_user.id
    @attendance.save
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @event = @attendance.event
    @attendance.destroy
  end

end
