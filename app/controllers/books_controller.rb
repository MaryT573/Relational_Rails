class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book_edit = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(title: params[:title], publication_date: params[:publication_date], fiction: params[:fiction])
    redirect_to "/books/#{book.id}"
  end
end
