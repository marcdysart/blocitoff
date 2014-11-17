class ItemsController < ApplicationController
  respond_to :html, :js
  def index
    @items = Item.all
    authorize @items
  end

  def show
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
  end

  def new
      @list = List.find(params[:list_id])
      @item = Item.new
      @item = @list.item
      authorize @item
  end

  def create
     @list = List.find(params[:list_id])
     @items = @list.items
     @item = current_user.items.build(item_params)
     @item.list = @list
     @new_item = Item.new
     authorize @item
     if @item.save
       flash[:notice] = "To-Do Item was saved."

     else
       flash[:error] = "There was an error saving the To-Do Item. Please try again."

     end
   end
def complete
  @list = List.find(params[:id])
  @item = Item.find(params[:id])
  authorize @item
  if @list.update_attributes(item_params)
    flash[:notice] = "A To-Do Item was marked completed."
    redirect_to @list
  else
    flash[:error] = "There was an error marking the To-Do item complete. Please try again."
    render :edit
  end
end

  def edit
     @list = List.find(params[:id])
     @item = Item.find(params[:id])
     authorize @item
  end

 def update
     @item = Item.find(params[:id])
     authorize @item
     if @item.update_attributes(item_params)
       flash[:notice] = "To-Do List was updated."
       redirect_to @item
     else
       flash[:error] = "There was an error saving the To-Do list. Please try again."
       render :edit
     end
   end


  def destroy

     @list = List.find(params[:list_id])
     @item = @list.items.find(params[:id])
     authorize @item

     if @item.destroy
       flash[:notice] = "Todo Item was removed."

     else
       flash[:error] = "Todo Item couldn't be deleted. Try again."

     end

     respond_with(@item) do |format|
       format.html { redirect_to @list }
     end

   end



  private

  def item_params
    params.require(:item).permit(:body)
  end

end
