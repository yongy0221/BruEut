class PartypostController < ApplicationController
  #------모든 action전 로그인/닉네임 생성 체크
  before_action :current_user
  before_action :user_name_done
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

<<<<<<< HEAD
  def partycomment
  partycomment = Partycomment.new
  partycomment.content = params[:content]

  partycomment.partypost_id = params[:partypost_id] ###
  partycomment.user = current_user
  partycomment.save
  redirect_to "/partypost"
end

=======
>>>>>>> 56a5a8f368b6cc782432e3fd2d4edebc23133d40
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

  puts "Test"
  us = User.all
  us.each do |u|
    puts u.id
    puts u.bname
  end
end
