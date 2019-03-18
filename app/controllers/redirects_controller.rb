class RedirectsController < ApplicationController
  def index
    @urls = Redirect.all.order(count: :desc)
  end

  def new
    @url = Redirect.new
  end

  def create
    @url = Redirect.new(redirect_params)
    if @url.save
      flash.now[:notice] = "Created successfully!"
      redirect_to edit_redirect_path(@url)
    else
      flash.now[:error] = "Error!"
      render "new"
    end
  end

  def edit
    @url = Redirect.find(params[:id])
  end

  def show
    @url = Redirect.find(params[:id])
  end

  def update
    @url = Redirect.find(params[:id])
    if @url.update_attributes(redirect_params)
    else
    end
  end

  def destroy
    if @url = Redirect.find(params[:id])
      @url.destroy
      flash.now[:notice] = "Deleted!"
      redirect_to redirects_path
    else
      flash.now[:error] = "Something went wrong!"
      redirect_to redirects_path
    end
  end

  # This is the short URL, redirect (if found) to full_url
  def redirect
    # Does it exist?
    if url = Redirect.find_by_short_url(params[:id])
      # Increment count
      url.update_attributes(count: url.count + 1)
      # Redirect
      redirect_to url.full_url
    else
      redirect_to redirects_path
    end
  end

  private

  def redirect_params
    params.require(:redirect).permit(:full_url, :short_url)
  end
end
