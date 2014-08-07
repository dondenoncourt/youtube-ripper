class RipperController < ApplicationController
  protect_from_forgery except: :create

  def index
    render text: 'index request'
  end

  # GET /ripper/1
  # GET /ripper/1.json
  def show
    render text: "get show request #{params[:id]}"
  end

  # GET /ripper/new
  # GET /ripper/new.json
  def new
    render text: "get new request"
  end

  # GET /ripper/1/edit
  def edit
    render text: "get edit request #{params[:id]}"
  end

  # POST /ripper
  # POST /ripper.json
  def create
    # TODO add specific path
    # String download_dir = new File(".").getAbsolutePath().replaceAll(/\.$/,'')+"target/"
    # String download_template = download_dir+'%(title)s-%(id)s.%(ext)s'
    # def proc = "youtube-dl -o ${download_template} ${url}".execute()
    system("youtube-dl -t https://www.youtube.com/watch?v=#{params[:id]}")
    render text: 'post request'
  end

  # PUT /ripper/1
  # PUT /ripper/1.json
  def update
    render text: 'put request #{params[:id]}'
  end

  # DELETE /ripper/1
  # DELETE /ripper/1.json
  def destroy
    render text: 'delete request #{params[:id]}'
  end

end
