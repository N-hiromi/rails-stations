class ReservationsController < ApplicationController
	def new
		@reservation = Reservation.new
	end

	def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:success] = "予約が完了しました"
      # redirect_to controller: :movies, action: :index
			schedule_id = reservation_params[:schedule_id]
			movie_id = Schedule.find(schedule_id).movie_id
			redirect_to controller: :movies, action: :show, id: movie_id
    else
      flash[:danger] = "登録失敗"
			schedule_id = reservation_params[:schedule_id]
			movie_id = Schedule.find(schedule_id).movie_id
			sheet_id = reservation_params[:sheet_id]
			date = reservation_params[:date]
      # render action: :new, :locals => { :schedule_id => schedule_id, :movie_id => movie_id, :sheet_id => sheet_id, :date => date}
			# render action: :new,  locals: { schedule_id: schedule_id, movie_id: movie_id, sheet_id: sheet_id, date: date}
			redirect_to action: :new, schedule_id: schedule_id, movie_id: movie_id, sheet_id: sheet_id, date: date
    end
  end

	def reservation_params
    params.require(:reservation).permit(:schedule_id, :sheet_id, :date, :name, :email)
  end
end
