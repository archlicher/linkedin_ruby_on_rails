class PagesController < ApplicationController

  layout 'admin'

  def index
    @pages = Page.sorted
  end

  def show
    @page = page
  end

  def new
    @page = Page.new()
    @page_count = Page.count + 1
    @subjects = Subject.sorted
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:notice] = "Created new page #{@page.name}!"
      redirect_to(pages_path)
    else
      flash[:error] = "Wrong input"
      @page_count = Page.count + 1
      @subjects = Subject.sorted
      render("new")
    end
  end

  def edit
    @page = page
    @page_count = Page.count
    @subjects = Subject.sorted
  end

  def update
    @page = page
    if @page.update_attributes(page_params)
      flash[:notice] = "Successfully updated page #{@page.name}"
      redirect_to(page_path(@page))
    else
      flash[:error] = "Something went wrong"
      @page_count = Page.count
      @subjects = Subject.sorted
      render("edit")
    end
  end

  def delete
    @page = page
  end

  def destroy
    @page = page
    @page.destroy
    flash[:notice] = "Page #{@page.name} deleted"
    redirect_to(pages_path)
  end

  private

  def page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
  end
end
