class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
     @list = current_user.lists.build(params.require(:list).permit(:title))
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
     if @list.update_attributes(params.require(:list).permit(:title))
       flash[:notice] = "To-Do List was updated."
       redirect_to @list
     else
       flash[:error] = "There was an error saving the To-Do list. Please try again."
       render :edit
     end
   end

end
