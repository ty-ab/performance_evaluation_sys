class EvaluationResultsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    evaluation_result_params()
  end

  def edit
  end

  def update
  end

  def destroy
  end
  

  private
    def evaluation_result_params
      params.require(:evaluation_result).permit!
      Rails.logger.info(params.inspect)
    end
end
