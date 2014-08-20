require 'aws-sdk'
require 'open3'

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

  # POST /ripper/:youtube_id/:bucket_name
  def create
    download_template = Dir.pwd+'/tmp/%(id)s.%(ext)s'
    begin
      # note, streaming std/err out is possible and explained in  http://blog.bigbinary.com/2012/10/18/backtick-system-exec-in-ruby.html
      Open3.popen3("youtube-dl -o '#{download_template}' https://www.youtube.com/watch?v=#{params[:youtube_id]}") do |stdin, stdout, stderr, wait_thr|
        logger.info "stdout: #{stdout.read}"
        standard_error = stderr.read
        if standard_error.size > 0
          raise ArgumentError, standard_error
        end
      end
      # get the generated file name so we upload to S3 with the correct suffix
      filename = Dir.entries(Pathname.new("#{Dir.pwd}/tmp")).select {|f| !File.directory?(f) && f =~ /#{params[:youtube_id]}/}[0]
puts "ENV['AWS_ACCESS_KEY_ID']: "+ENV['AWS_ACCESS_KEY_ID']
puts "ENV['AWS_SECRET_ACCESS_KEY']: "+ENV['AWS_SECRET_ACCESS_KEY']
      s3 = AWS::S3.new
      bucket = s3.buckets[params[:bucket_name]] # 'jukinvideo_unit_tests'
      if !bucket.exists?
        raise ArgumentError, "S3 bucket called #{params[:bucket_name]} does not exist"
      end
      bucket.objects[filename].write(Pathname.new("#{Dir.pwd}/tmp/#{filename}"))
      File.delete "#{Dir.pwd}/tmp/#{filename}"
      render json: {success: "#{filename} uploaded to S3 in #{params[:bucket_name]}"}
    rescue Exception => e
      logger.info e.to_s
      render json: {error: 'internal-server-error', exception: "#{e.class.name} : #{e.message}"}, status: 422
    end
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
