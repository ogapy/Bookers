class BooksController < ApplicationController
  def top
  	
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def create
  	@books = Book.all
  	# @book = Book.new
  	@book = Book.new(book_params)
  	book = Book.new(book_params)
  	if @book.save
  		flash[:create] = "Book was successfully created."
  		redirect_to book_path(@book)
  	else
  		render action: :index
  		# render plain: @book.errors.inspect
  	end
  end

  def update
  	book = Book.find(params[:id])
  	@book = Book.find(params[:id])
  	@book.title = params[:title]
  	@book.body = params[:body]
  	# book.update(book_params)
  	if book.update(book_params)
  		flash[:update] = "Book was successfully updated."
  		redirect_to book_path(book)
  	else
  		render action: :edit
  	end
  	
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	if book.destroy
  		flash[:destroy] = "Book was successfully destroyed."
  	end
  	redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
