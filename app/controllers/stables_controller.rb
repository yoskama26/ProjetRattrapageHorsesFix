class StablesController < ApplicationController
  def index
    @stables = Stable.all.includes(:horses)
  end

  def show
    @stable = Stable.find(params[:id])
  end

  def new
    @stable = Stable.new
    @stable.build_address
  end

  def create
    @stable = Stable.new(stable_params)
    if @stable.save
      redirect_to @stable
    else
      render :new
    end
  end

  def edit
    @stable = Stable.find(params[:id])
  end

  def update
    @stable = Stable.find(params[:id])
    if @stable.update(stable_params)
      redirect_to @stable
    else
      render :edit
    end
  end


  def destroy
    @stable = Stable.find(params[:id])
    @stable.destroy

    respond_to do |format|
      format.html { redirect_to stables_path, notice: 'Stable was successfully deleted.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@stable) }
    end
  end
  

  private

  def stable_params
    params.require(:stable).permit(:name, address_attributes: [:id, :line1, :zipcode, :city, :country])
  end
end
