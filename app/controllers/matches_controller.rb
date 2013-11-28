class MatchesController < ApplicationController

  before_filter :authenticate_user!, except: %i(index)

  def index
  end

  def find
  end

end
