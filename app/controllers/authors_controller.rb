class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author_create = Author.new
  end

  def create
    Author.create(name: params[:name], number_books: params[:number_books], alive: params[:alive])
    redirect_to '/authors'
  end

  def edit
    @author_edit = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    author.update(name: params[:name], number_books: params[:number_books], alive: params[:alive])
    redirect_to "/authors/#{author.id}"
  end
end
