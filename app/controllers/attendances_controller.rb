class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new
    @event = Event.find(params[:event_id])
    @attendance.user = current_user
    @attendance.event = @event
    @attendance.save
      redirect_to event_path(@event)
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @event = @attendance.event
    @attendance.destroy
    redirect_to event_path(@event)
  end

  private

  def attendance_params
    params.require(:attendance).permit(:event_id, :user_id)
  end

end
