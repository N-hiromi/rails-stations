class MoviesController < ApplicationController
	def index		
		# @q = Movie.ransack(params[:q])
		# @rangeは全てか上映中か上映予定か絞ったMovie配列
		# @range = @q.result(distinct: true).order("created_at desc")
		@rgp = params[:is_showing]
		@keyp = params[:keyword]
		
		#入力値がなければ全て表示(初期表示含む)
		if @rgp == "" && @keyp == ""
			@movies = Movie.all
		end

		# @rangeは全てか上映中か上映予定か絞ったMovie配列
		if @rgp == "1"
			@range = Movie.where(is_showing: true)
		elsif @rgp == "0"
			@range = Movie.where(is_showing: false)
		else
			@range = Movie.all
		end

		if (@keyp == "")
			@movies = @range
		else
			@movies = @range.where( "name LIKE ? OR description LIKE ? ", "%#{@keyp}%", "%#{@keyp}%")
		end
	end
end
