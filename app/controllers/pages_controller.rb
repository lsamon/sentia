class PagesController < ApplicationController
  def import
    upload = params[:upload]
    results = ImportPeople.new(upload).call
    if results.success?
      redirect_to people_path, notice: 'People imported successfully'
    else
      redirect_to root_path, alert: "Importing had errors.\n #{results.errors.to_sentence}"
    end
  end

  def index; end
end
