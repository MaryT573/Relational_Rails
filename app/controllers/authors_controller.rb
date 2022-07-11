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
end
