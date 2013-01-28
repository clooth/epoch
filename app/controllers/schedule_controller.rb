class ScheduleController < ApplicationController
  def index 
    @schedules = current_user.schedules.all
  end
end
