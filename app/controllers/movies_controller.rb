class MoviesController < ApplicationController
	def index
		@q = Movie.ransack(params[:q])
		@movies = @q.result(distinct: true).order("created_at desc")
	end
end
