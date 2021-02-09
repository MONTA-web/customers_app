class BlogsController < ApplicationController
  def index
    @customers = Customer.includes(:user)
  end
end
