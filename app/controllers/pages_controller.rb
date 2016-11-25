class PagesController < ApplicationController

  def index
    @pages = Page.sorted
  end

  def show
    @page = page
  end

  def new
    @page = Page.new()
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:notice] = "Created new page #{@page.name}!"
      redirect_to(pages_path)
    else
      flash[:error] = "Wrong input"
      render("new")
    end
  end

  def edit
    @page = page
  end

  def update
    @page = page
    if @page.update_attributes(page_params)
      flash[:notice] = "Successfully updated page #{@page.name}"
      redirect_to(page_path(@page))
    else
      flash[:error] = "Something went wrong"
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
