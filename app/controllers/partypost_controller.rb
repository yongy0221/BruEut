class PartypostController < ApplicationController
  before_action :current_user
  def index
    @partyposts = Partypost.all
  end

  def partycreate
    p = Partypost.new
    p.article = params[:article]
    p.user = current_user
    p.total = params[:total]
    p.save
    redirect_to "/partypost"
  end

  def partylike
    l = Partylike.new
    l.user = current_user
    l.partypost_id = params[:post_id]
    l.save
    redirect_to "/partypost"
  end

  def partyunlike
    l = Partylike.where(:partypost_id => params[:post_id]).where(:user => current_user).take
    l.delete
    redirect_to "/partypost"
  end

  def partyjoin
    j = Partyjoin.new
    j.user = current_user
    j.partypost_id = params[:post_id]
    j.save
    redirect_to "/partypost"
  end

  def partydisjoin
    j = Partyjoin.where(:partypost_id => params[:post_id]).where(:user => current_user).take
    j.delete
    redirect_to "/partypost"
  end


end
