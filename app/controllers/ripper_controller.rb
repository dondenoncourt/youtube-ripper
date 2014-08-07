require 'aws-sdk'

class RipperController < ApplicationController
  protect_from_forgery except: :create

  def index
    render text: 'index request'
  end

  # GET /ripper/1
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

  # POST /ripper/:youtube_id
  def create
    download_template = Dir.pwd+'/tmp/%(id)s.%(ext)s'
    system("youtube-dl -o '#{download_template}' https://www.youtube.com/watch?v=#{params[:id]}")
    # TODO figure out the explicit file name so we have the suffix
    s3 = AWS::S3.new
    bucket = s3.buckets['jukinvideo_unit_tests']
    bucket.objects[params[:id]].write(Pathname.new("#{Dir.pwd}/tmp/#{params[:id]}.mp4"))
    # bucket.objects['key'].write('Pathname.new("#{Dir.pwd}/tmp/#{params[:id]}.mp4")')
    # TODO exception block and delete youtube download -- if no exception on S3 write

    render text: 'post request'
  end

  # PUT /ripper/1
  def update
    render text: 'put request #{params[:id]}'
  end

  # DELETE /ripper/1
  def destroy
    render text: 'delete request #{params[:id]}'
  end

end
