class CollegesController < ApplicationController
  def index
    @colleges = College.all
  end

  def new
    @college = College.new
  end

  def create
    @college = College.new(college_params)

    respond_to do |format|
      if @college.save
        format.js
      else
        # format.html { render 'new'}
      end
        
      end
    # if @college.save
    #   redirect_to colleges_path
    # else
    #   render 'new'
    # end
  end

  def edit
    @college = College.find(params[:id])
  end

  def update
    @college = College.find(params[:id])
    if @college.update(college_params)
      redirect_to colleges_path
    else
      render 'edit'
    end
  end

  def destroy
    @college = College.find(params[:id])
    @college.destroy
    redirect_to colleges_path
  end

  private
  def college_params
    params.require(:college).permit(:college_name)
  end
end
