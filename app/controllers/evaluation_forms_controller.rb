class EvaluationFormsController < ApplicationController
  def index
    @evaluation_forms = EvaluationForm.all
  end

  def new
    @evaluation_form = EvaluationForm.new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
