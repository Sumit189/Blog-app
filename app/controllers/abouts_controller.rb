class AboutsController < ApplicationController
  def info
    @abouts = About.last
  end

  def new
    if current_user.name.to_s == 'admin'.to_s
      @about = About.new
    else
      redirect_to root_path
    end
  end
  def edit
    @about = About.find(params[:id])
  end

  def create
    @about = About.new(about_params)
    if @about.save
      flash[:notice] = "Successfully created about."
      redirect_to abouts_info_path
    else
      render :action => 'new'
    end
  end

  def update
    @about = About.find(params[:id])
    if @about.update(about_params)
      flash[:notice] = "Successfully updated about."
      redirect_to abouts_info_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @about.destroy
    flash[:notice] = "Successfully destroyed about."
    redirect_to abouts_info_path
  end

  private
  def about_params
    params.require(:about).permit(:about)
  end

end
