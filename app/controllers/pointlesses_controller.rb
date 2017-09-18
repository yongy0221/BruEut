class PointlessesController < ApplicationController
  #------모든 action전 닉네임 생성 체크/params
  before_action :set_pointless, only: [:show, :edit, :update, :destroy]
  before_action :user_name_done
  #------like/dislike
  def like
    @user=current_user
    @pointless = Pointless.find(params[:pointless_id])
    if @pointless.pluids.where(user_id: @user.id).present?
      @pointless.pluids.where(user_id: @user.id).first.destroy
      @pointless.like = @pointless.like - 1
    else
      @pluid = Pluid.new(user_id: current_user.id, pointless_id: @pointless.id)
      @pluid.save
      @pointless.like = @pointless.like + 1
    end
    if @pointless.like > 9
      @pointless.rec = true
    else
      @pointless.rec = false
    end
    @pointless.save
    redirect_to :back
  end
  def dislike
    @user=current_user
    @pointless = Pointless.find(params[:pointless_id])
    if @pointless.pdluids.where(user_id: @user.id).present?
      pl=@pointless.pdluids.where(user_id: @user.id).first.destroy
      @pointless.dislike = @pointless.dislike - 1
    else
      @pdluid = Pdluid.new(user_id: current_user.id, pointless_id: @pointless.id)
      @pdluid.save
      @pointless.dislike = @pointless.dislike + 1
    end
      @pointless.save
      redirect_to :back
  end
  #------목록
  def index
    @pointlesses = Pointless.paginate(:page => params[:page], :per_page => 20).reverse_order
  end
  #------게시글 보기
  def show
    @user=current_user
  end
  #------게시글 생성
  def new
    @pointless = Pointless.new
  end
  def create
    @pointless = Pointless.new(pointless_params)
    @pointless.user_id = current_user.id
    @pointless.hit = 0
    @pointless.like = 0
    @pointless.dislike = 0
    respond_to do |format|
      if @pointless.save
        format.html { redirect_to @pointless}
        format.json { render :show, status: :created, location: @pointless }
      else
        format.html { render :new }
        format.json { render json: @pointless.errors, status: :unprocessable_entity }
      end
    end
  end
  #------게시글 수정
  def edit
    unless current_user==@pointless.user
      redirect_to pointlesses_path
    end
  end
  def update
    respond_to do |format|
      if @pointless.update(pointless_params)
        format.html { redirect_to @pointless}
        format.json { render :show, status: :ok, location: @pointless }
      else
        format.html { render :edit }
        format.json { render json: @pointless.errors, status: :unprocessable_entity }
      end
    end
  end
  #------게시글 삭제
  def destroy
    if current_user.id == @pointless.user.id  || current_user.tier < 4
      @pointless.destroy
      respond_to do |format|
        format.html { redirect_to pointlesses_path}
        format.json { head :no_content }
      end
    else
      redirect_to pointlesses_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pointless
      @pointless = Pointless.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pointless_params
      params.require(:pointless).permit(:title, :content)
    end
end
