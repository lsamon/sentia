class PeopleController < ApplicationController
  helper_method :sort_column, :sort_direction

  def import; end

  def index
    @people = Person
    if params[:name].present?
      name = params[:name].downcase
      @people = Person.where("lower(first_name) LIKE ? OR lower(last_name) LIKE ?", "%#{name}%", "%#{name}%")
    end

    @people = @people.order(sort_column + " " + sort_direction).page(params[:page])
  end

  private

  def sort_column
    Person.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
