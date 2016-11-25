class SubjectsController < ApplicationController
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = subject
  end

  def new
    @subject = Subject.new({:name => 'Default'})
  end

  def create
    # init new object wil vals
    @subject = Subject.new(subject_params)
    # save ?
    if @subject.save
      # succ
      flash[:notice] = "Subject #{@subject.name} created successfully!"
      redirect_to(subjects_path)
    else
      # fail
      flash[:error] = "Something went wrong"
      render('new')
    end
  end

  def edit
    @subject = subject
  end

  def update
    @subject = subject
    # save ?
    if @subject.update_attributes(subject_params)
      # succ
      flash[:notice] = "Subject #{@subject.name} updated!"
      redirect_to(subject_path(@subject))
    else
      # fail
      render('edit')
    end
  end

  def delete
    @subject = subject
  end

  def destroy
    @subject = subject
    @subject.destroy
    flash[:notice] = "Subject #{@subject.name} deleted!"
    redirect_to(subjects_path)
  end

  private

  def subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
