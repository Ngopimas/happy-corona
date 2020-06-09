class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
  end

  def create
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new(attendance_params)
    @attendance.event = @event
      redirect_to event_path(@event)
  end


  private

  def attendance_params
    params.require(:attendance).permit(:event_id, :user_id)
  end

end
