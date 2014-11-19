require 'rails_helper'

 describe List do
   describe "the todo list" do

     before do
      @user = User.new(name: "George", email: "hello@bloc.com", password:"PASSWORD")
      @user.skip_confirmation!
      @user.save!
      @list = List.create(title: "my list", user: @user)
      @list.items.create(body: "we are a list item")

     end


       it "can have many items" do

         expect( @list.items.count).to eq(1)
       end

       it "can have items deleted" do
         @list.items.first.delete
         expect( @list.items.count).to eq(0)
       end


   end
 end
