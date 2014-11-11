class ListsController < ApplicationController
  def index
    @lists = List.all
    authorize @lists
  end

  def show
    @list = List.find(params[:id])
    authorize @list
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
     @list = current_user.lists.build(list_params)
     authorize @list
     if @list.save
       flash[:notice] = "To-Do List was saved."
       redirect_to @list
     else
       flash[:error] = "There was an error saving the To-Do list. Please try again."
       render :new
     end
   end

 def edit
     @list = List.find(params[:id])
  end

   def update
     @list = List.find(params[:id])
     authorize @list
     if @list.update_attributes(list_params)
       flash[:notice] = "To-Do List was updated."
       redirect_to @list
     else
       flash[:error] = "There was an error saving the To-Do list. Please try again."
       render :edit
     end
   end

  private

  def list_params
    params.require(:list).permit(:title)
  end

end
