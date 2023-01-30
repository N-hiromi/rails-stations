class ReservationsController < ApplicationController
	def new
		@reservation = Reservation.new
		date = params[:date]
		sheet_id = params[:sheet_id]
		schedule_id = params[:schedule_id]
		movie_id = Schedule.find(schedule_id).movie_id

		if date == nil && sheet == nil
			# render status:302
			# redirect_to :reservation_movie_path
			redirect_to("/movies/#{movie_id}/reservation")
		end
	end

	def create
    @reservation = Reservation.new(reservation_params)

		# パラメータ
		schedule_id = reservation_params[:schedule_id]
		movie_id = Schedule.find(schedule_id).movie_id
		sheet_id = reservation_params[:sheet_id]
		date = reservation_params[:date]
				
		# 同じ日付で同じ映画、同じ席が取られていないか確認
		dup = Reservation.where( "schedule_id LIKE ? OR sheet_id LIKE ? ", "#{schedule_id}", "%#{sheet_id}%")
		if dup = nil
			if @reservation.save
				flash[:success] = "予約が完了しました"
				redirect_to controller: :movies, action: :show, id: movie_id
			else
				flash[:danger] = "登録失敗"
				redirect_to action: :new, schedule_id: schedule_id, movie_id: movie_id, sheet_id: sheet_id, date: date
			end
		else
			# render {"status":302}
			flash[:danger] = "その座席はすでに予約済みです"
			redirect_to("/movies/#{movie_id}/reservation?schedule_id=#{schedule_id}&date=#{date}&movie_id=#{movie_id}")
		end

  end

	def reservation_params
    params.require(:reservation).permit(:schedule_id, :sheet_id, :date, :name, :email)
  end
end

