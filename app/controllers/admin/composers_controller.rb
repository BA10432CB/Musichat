class Admin::ComposersController < ApplicationController
  def create
    @composer = Composer.new(composer_params)
    if @composer.save
      redirect_to admin_composers_path
    else
      render 'index'
    end
  end

  def index
    @composers = Composer.all
    @composer = Composer.new
  end

  def edit
    @composer = Composer.find(params[:id])
  end

  def update
    @composer = Composer.find(params[:id])
    if @composer.update(composer_params)
      redirect_to admin_composers_path
    else
      render 'edit'
    end
  end

  def destroy
    @composer = Composer.find(params[:id])
    @composer.destroy
    redirect_to admin_composers_path
  end

  private

  def composer_params
    params.require(:composer).permit(:name)
  end
end
