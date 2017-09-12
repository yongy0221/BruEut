class PointlessesController < ApplicationController
  before_action :set_pointless, only: [:show, :edit, :update, :destroy]

  # GET /pointlesses
  # GET /pointlesses.json
  def like
    @pointless = Pointless.find(params[:pointless_id])
    iorn = true
    @pointless.pluids.each do |p|
      puts p.user_id
      if current_user.id == p.user_id
        p.destroy
        iorn = false
        break
      end
    end
    if iorn == true
      @pluid = Pluid.new(user_id: current_user.id, pointless_id: @pointless.id)
      @pluid.save
      @pointless.like = @pointless.like + 1
    else
      @pointless.like = @pointless.like - 1
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
      @pointless = Pointless.find(params[:pointless_id])
      iorn = true
      @pointless.pdluids.each do |p|
        puts p.user_id
        if current_user.id == p.user_id
          p.destroy
          iorn = false
          break
        end
      end
      if iorn == true
        @pdluid = Pdluid.new(user_id: current_user.id, pointless_id: @pointless.id)
        @pdluid.save
        @pointless.dislike = @pointless.dislike + 1
      else
        @pointless.dislike = @pointless.dislike - 1
      end
      @pointless.save
      redirect_to :back

    end
  def index
    @pointlesses = Pointless.paginate(:page => params[:page], :per_page => 20).reverse_order
  end

  # GET /pointlesses/1
  # GET /pointlesses/1.json
  def show
    @user=current_user
    end

  # GET /pointlesses/new
  def new
    @pointless = Pointless.new
  end

  # GET /pointlesses/1/edit
  def edit
  end

  # POST /pointlesses
  # POST /pointlesses.json
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


  # PATCH/PUT /pointlesses/1
  # PATCH/PUT /pointlesses/1.json
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

  # DELETE /pointlesses/1
  # DELETE /pointlesses/1.json
  def destroy
    @pointless.destroy
    respond_to do |format|
      format.html { redirect_to pointlesses_path}
      format.json { head :no_content }
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
