class GalleriesController < ApplicationController

  before_filter :authenticate_user!
  
  @@BUCKET = "chocochomp"

  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.json
  def new
    @gallery = Gallery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
  end

  # POST /galleries
  # POST /galleries.json
  def create
    ## S3

    uploaded_io = params[:gallery][:thumbnail]
    filename = sanitize_filename(uploaded_io.original_filename)
    filepath = "galleries/pic" + Time.now.to_i.to_s + filename
    AWS::S3::S3Object.store(filepath, uploaded_io.read, @@BUCKET, :access => :public_read)
    url = AWS::S3::S3Object.url_for(filepath, @@BUCKET, :authenticated => false)
    
    params[:gallery][:thumbnail] = url
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, :notice => 'Gallery was successfully created.' }
        format.json { render :json => @gallery, :status => :created, :location => @gallery }
      else
        format.html { render :action => "new" }
        format.json { render :json => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.json
  def update
    @gallery = Gallery.find(params[:id])

    #We need to update the S3 file too
    #1- Remove the old file
    begin
      AWS::S3::S3Object.find(@gallery.thumbnail, @@BUCKET).delete
    rescue Exception=>e
      # handle e
    end

    #2- Add the new file
    uploaded_io = params[:gallery][:thumbnail]
    filename = sanitize_filename(uploaded_io.original_filename)
    filepath = "arts/pic" + Time.now.to_i.to_s + filename
    AWS::S3::S3Object.store(filepath, uploaded_io.read, @@BUCKET, :access => :public_read)
    url = AWS::S3::S3Object.url_for(filepath, @@BUCKET, :authenticated => false)
    params[:gallery][:thumbnail] = url

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to @gallery, :notice => 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery = Gallery.find(params[:id])

    begin
      AWS::S3::S3Object.find(@gallery.thumbnail, @@BUCKET).delete
    rescue Exception=>e
      # handle e
    end
    
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :no_content }
    end
  end

  def sanitize_filename(file_name)
    just_filename = File.basename(file_name)
    just_filename.sub(/[^\w\.\-]/,'_')
  end
end


