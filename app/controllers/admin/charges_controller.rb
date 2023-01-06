class Admin::ChargesController < ApplicationController
  def index
    @charges = Charge.all
  end
end
