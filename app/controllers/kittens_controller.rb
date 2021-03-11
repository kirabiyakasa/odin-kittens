class KittensController < ApplicationController

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    respond_to do |format|
      if @kitten.save
        format.html { redirect_to kittens_path,
        notice: 'Kitten was successfully created.' }
      else
        format.html { render new_kitten_path(@kitten),
        notice: 'Unable to create kitten.' }
      end
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      if @kitten.update(kitten_params)
        format.html { redirect_to kitten_path(@kitten), 
        notice: 'Kitten was successfully edited.' }
      else
        format.html { redirect_to edit_kitten_path(@kitten),
        notice: 'Unable to update kitten.' }
      end
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      if @kitten.destroy
        format.html { redirect_to kittens_path, 
        notice: 'Kitten was successfully deleted.' }
      else
        format.html { redirect_to kittens_path,
        notice: 'Unable to delete kitten.' }
      end
    end
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
