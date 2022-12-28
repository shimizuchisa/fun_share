class Public::HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    @events = Event.all
  end

end