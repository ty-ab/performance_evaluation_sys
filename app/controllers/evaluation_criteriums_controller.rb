class EvaluationCriteriumsController < ApplicationController
  def index
    @evaluation_criteriums = EvaluationCriterium.all
  end

  def new
    @evaluation_criterium = EvaluationCriterium.new
  end

  # def show
  # end

  def create
    @evaluation_criterium = EvaluationCriterium.new(evaluation_criterium_params)
    if @evaluation_criterium.save
      redirect_to evaluation_criteriums_path
    else
      render 'new'
    end
  end

  def edit
    @evaluation_criterium = EvaluationCriterium.find(params[:id])
  end

  def update
    @evaluation_criterium = EvaluationCriterium.find(params[:id])
    if @evaluation_criterium.update(evaluation_criterium_params)
      redirect_to evaluation_criteriums_path
    else
      render 'edit'
    end
  end

  def destroy
    @evaluation_criterium = EvaluationCriterium.find(params[:id])
    @evaluation_criterium.destroy
    redirect_to evaluation_criteriums_path
  end

  private
  def evaluation_criterium_params
    params.require(:evaluation_criterium).permit(:criteria,:description)
  end
end
