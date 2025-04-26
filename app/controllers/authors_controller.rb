class AuthorsController < ApplicationController
  # GET /authors
  def index
    @authors = Author.all

    render json: @authors
  end

  # GET /authors/1
  def show
    @author = Author.find(params[:id])

    render json: @author
  end

  # POST /authors
  def create
    @author = Author.new(author_params)

    if @author.save
      render json: @author, status: :created, location: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authors/1
  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      render json: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authors/1
  def destroy
    @author = Author.find(params[:id])
    if @author
      @author.destroy!
      render json: {message: "Author deleted"}, status: :ok
    else
      render json: {message: "Not found"}, status: :not_found
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:name, :lastName)
    end
end
