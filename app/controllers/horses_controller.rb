# app/controllers/horses_controller.rb
class HorsesController < ApplicationController
  include ActionView::RecordIdentifier
  def index
    @horses = Horse.all
  end

  def new
    @horse = Horse.new
  end

  def create
    @horse = Horse.new(horse_params)
    if @horse.save
      respond_to do |format|
        format.html { redirect_to horses_path, notice: 'Horse was successfully created.' }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @horse = Horse.find(params[:id])
  end

  def update
    @horse = Horse.find(params[:id])
    if @horse.update(horse_params)
      respond_to do |format|
        format.html { redirect_to horses_path, notice: 'Horse was successfully updated.' }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@horse) }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

# app/controllers/horses_controller.rb
def destroy
  @horse = Horse.find(params[:id])
  @horse.destroy

  respond_to do |format|
    format.html { redirect_to horses_path, notice: 'Horse was successfully deleted.' }
    format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@horse)) }
  end
end

  

  private

  def horse_params
    params.require(:horse).permit(:name, :race, :color, :stable_id)
  end
end
