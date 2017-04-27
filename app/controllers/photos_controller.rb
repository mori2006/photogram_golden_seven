class PhotosController < ApplicationController

  def index
    @list_of_all_my_photos =Photo.all

    render("photos/index.html.erb")
  end

  def show
    the_id = params[:da_id]
    @my_photo = Photo.find(the_id)

    render("photos/show.html.erb")
  end

  def new_form


    render("photos/new_form.html.erb")
  end

  def create_row
    url = params[:da_source]
    cap = params[:da_caption]
    new_photo = Photo.new
    new_photo.source = url
    new_photo.caption = cap
    new_photo.save

    # render("photos/create_row.html.erb")
    redirect_to("/photos")
  end

  def edit_form
    the_id = params[:id]
    @my_photo = Photo.find(the_id)

    render("photos/edit_form.html.erb")
  end

  def update_row
    the_id = params[:id]
    url = params[:the_source]
    cap = params[:the_caption]
    Photo.find(the_id).update_attribute(:source,url)
    Photo.find(the_id).update_attribute(:caption,cap)

    # render("photos/update_row.html.erb")
    redirect_to("/photos/#{the_id}")
  end

  def destroy_row
    the_id = params[:id]
    my_photo = Photo.find(the_id)
    my_photo.destroy

    # render("photos/destroy_row.html.erb")
    redirect_to("/photos")
  end

end
