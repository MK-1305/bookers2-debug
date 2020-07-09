class SearchesController < ApplicationController
  def search
    method = params[:search_method]
    word = params[:search_word]
   if "user" == params[:search_model]
    @users = User.search(method,word)
    render 'search_user'
   else
    @books = Book.search(method,word)
    render 'search_book'
   end
  end
end
