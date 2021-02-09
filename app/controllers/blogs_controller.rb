class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @customers = Customer.includes(:user)
  end
end
