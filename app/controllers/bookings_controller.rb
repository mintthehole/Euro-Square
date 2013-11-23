class BookingsController < ApplicationController
  before_filter :authenticate_user!
  active_scaffold :booking do |conf|
  end
end 