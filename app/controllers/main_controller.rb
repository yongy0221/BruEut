class MainController < ApplicationController
  def dashboard
  end

  def rindex
    @pointlesses = Pointless.where(:rec => true).paginate(:page => params[:page], :per_page => 20).reverse_order
  end

  def mrindex
    @markets = Market.where(:rec => true).paginate(:page => params[:page], :per_page => 20).reverse_order
  end

end
