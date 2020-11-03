require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    n = rand(7..10)
    alphabet = [*?A..?Z]
    size = alphabet.size
    @new_grid = n.times.map { alphabet[rand(size)] }
    @new_grid
  end

  def score
    @results = params[:score]
    url = "https://wagon-dictionary.herokuapp.com/#{@results}"
    content = RestClient.get(url)
    dictionnary = JSON.parse(content, symbolize_names: true)
    letters = @new_grid.split(',')
    "Sorry but #{@results} can't be built out of #{letters}." if @results.include?(letters)
    if results.match
      @score = "Well done, you score 1 point!"
    else
      @score = "Sorry, but #{@results} is not a valid English word."
    end
  end
end
# You cannot use/have access to @new_grid in the score method.
# Cannot share instance variables in two methods.
