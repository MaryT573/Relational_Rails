class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @books = @author.books
    #require "pry"; binding.pry
    if params[:sort] == "alpha"
      @books = @author.books.sort_alpha
    elsif params[:published]
      @books= @author.books.where("publication_date > #{params[:published]}")
    else
      @books = @author.books
    end
  end

  def new
    @author = Author.find(params[:author_id])
    @books = @author.books
  end

  def create
    author = Author.find(params[:author_id])
    author.books.create(title: params[:title], publication_date: params[:publication_date], fiction: params[:fiction])
    redirect_to "/authors/#{author.id}/books"
  end
end
