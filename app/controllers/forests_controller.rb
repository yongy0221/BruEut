class ForestsController < ApplicationController
  #-----모든 action 전 닉네임 완료 체크/forest params 받아오기
  before_action :set_forest, only: [:show, :edit, :update, :destroy]
  before_action :user_name_done
  before_action :tiercheck, only: [:maketrue, :blind, :admin, :admin_part, :edit, :destroy, :show]
  #------목록/유저대숲랜딩
  def index
    @forests = Forest.all.reverse_order
  end
  #-----새 사연 생성
  def new
    @forest = Forest.new
  end
  def create
    @forest = Forest.new(forest_params)
    @forest.censored=false
    respond_to do |format|
      if @forest.save
        format.html { redirect_to forests_path, notice: true }
        format.json { render :show, status: :created, location: @forest }
      else
        format.html { render :new }
        format.json { render json: @forest.errors, status: :unprocessable_entity }
      end
    end
  end
  #-------관리용 권한 체크
  def tiercheck
    if current_user.tier > 3
      redirect_to forests_path
    end
  end
  #------관리용 페이지
  def admin
    @forests = Forest.all.reverse_order
  end
  def admin_part
    @forests = Forest.where(:censored => false).reverse_order
  end
  def show
    @forest=Forest.find(params[:id])
  end
  def edit
  end
  def update
    respond_to do |format|
      if @forest.update(forest_params)
        format.html { redirect_to @forest, notice: 'Forest was successfully updated.' }
        format.json { render :show, status: :ok, location: @forest }
      else
        format.html { render :edit }
        format.json { render json: @forest.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @forest.destroy
    respond_to do |format|
      format.html { redirect_to forests_path }
      format.json { head :no_content }
    end
  end
  #------사연 공개/비공개 설정
  def maketrue
     @forest=Forest.find(params[:format])
     @forest.censored=true
     @forest.save
     redirect_to :back
  end
  def blind
     @forest=Forest.find(params[:format])
     @forest.censored=false
     @forest.save
     redirect_to :back
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forest
      @forest = Forest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forest_params
      params.require(:forest).permit(:content)
    end
end
