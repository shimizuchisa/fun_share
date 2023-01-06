class Admin::HomesController < ApplicationController
  def top
    @events = Event.all
  end
end
