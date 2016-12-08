class SectionsController < ApplicationController

  layout 'admin'

  before_action :find_section, :only => [:show, :edit, :update, :delete, :destroy]
  before_action :find_pages, :only => [:new, :create, :edit, :update]
  before_action :set_section_count, :only => [:new, :create, :edit, :update]

  def index
    @sections = Section.sorted
  end

  def show
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
  end

  def update
    if @section.update_attributes(section_params)
      flash[:notice] = "Section #{@section.name}"
      redirect_to(section_path(@section))
    else
      flash[:error] = "Something went wrong"
      render('edit')
    end
  end

  def delete
  end

  def destroy
    @section.destroy
    flash[:notice] = "Deleted section #{@section.name}"
    redirect_to(sections_path)
  end

  private

  def find_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content, :content_type)
  end

  def find_pages
    @pages = Page.sorted
  end

  def set_section_count
    @section_count = Section.count
    if params[:action] == 'new' || params[:action] == 'create'
      @section_count += 1
    end
  end
end
