#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart

  def visit_incrementer
    if session[:counter].nil?
      session[:counter] = 0
    end
    session[:counter] +=1
  end

  def index
    @products = Product.order(:title)
    @visits = visit_incrementer
    if @visits > 5
    @visit_message = "You've been to this page #{@visits} #{"time".pluralize(@visits)}."
    else
    @visit_message = ""
    end
  end

end