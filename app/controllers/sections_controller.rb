class SectionsController < ApplicationController

  layout 'admin'

  def index
    @sections = Section.sorted
  end

  def show
    @section = section
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      flash[:notice] = "Section #{@section.name}"
      redirect_to(sections_path)
    else
      flash[:error] = "Something went wrong"
      render('new')
    end
  end

  def edit
    @section = section
  end

  def update
    @section = section
    if @section.update_attributes(section_params)
      flash[:notice] = "Section #{@section.name}"
      redirect_to(section_path(@section))
    else
      flash[:error] = "Something went wrong"
      render('edit')
    end
  end

  def delete
    @section = section
  end

  def destroy
    @section = section
    @section.destroy
    flash[:notice] = "Deleted section #{@section.name}"
    redirect_to(sections_path)
  end

  private

  def section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content, :content_type)
  end
end
