class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      flash[:notice] = "errors prohibited this obj from being saved."
      render :index
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
    # @books = Book.page(params[:page]).reverse_order
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "You have destroyed book successfully."
    redirect_to books_path()
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit 
  @book = Book.find(params[:id])
  end
  
  def update
   @book = Book.find(params[:id])
   @book.user_id = current_user.id
   if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book)
   else
    flash[:notice] = "errors prohibited this obj from being saved." 
    render "edit"
   end
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end

