class SubjectsController < ApplicationController

  layout 'admin'

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = subject
  end

  def new
    @subject = Subject.new({:name => 'Default'})
    @subject_count = Subject.count + 1
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
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = subject
    @subject_count = Subject.count
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
      flash[:error] = "Something went wrong"
      @subject_count = Subject.count + 1
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
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end

end
