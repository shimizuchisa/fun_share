class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @events = Event.all
  end
end
