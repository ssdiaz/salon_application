class SchedulesController < ApplicationController
    def new
        @schedule = Schedule.new
        @days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    end

    def create
        @schedule = Schedule.new(schedule_params)
        if @schedule.save

            puts params

            redirect_to @schedule 
        else
            render 'new'
        end
    end

    def show
        @schedule = Schedule.find(params[:id])
    end


    private

    def schedule_params
        params.require(:schedule).permit(:start_time, :end_time, :workday, :stylist_id)
    end

end
