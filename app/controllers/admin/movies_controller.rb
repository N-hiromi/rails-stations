class Admin::MoviesController < ApplicationController
  def index
    def index
      @movies = Movie.all
    end
  end
end
