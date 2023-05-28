class EvaluationFormsController < ApplicationController
  def index
    @evaluation_forms = EvaluationForm.all
  end

  def new
    @evaluation_form = EvaluationForm.new
    @evaluation_criteriums = EvaluationCriterium.all
  end

  def show
  end

  def create
    @evaluation_form = EvaluationForm.new(evaluation_form_params)
    if @evaluation_form.save
      redirect_to evaluation_forms_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @evaluation_form = EvaluationForm.find(params[:id])
    @evaluation_form.destroy
    redirect_to evaluation_forms_path
  end

  private
    def evaluation_form_params
      params.require(:evaluation_form).permit(:evaluator,:form_fields)
    end
end
