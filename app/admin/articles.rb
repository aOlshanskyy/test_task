ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :user_id, :body, :publish, :access
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :user_id, :body, :publish, :access, images: []]
  # #   permitted << :other if params[:action] == 'create' && current_user.admin?
  # #   permitted
  # end
  before_filter :only => [:show, :edit, :update, :destroy] do
    @article = Article.find_by_hashed_id(params[:id])
  end
    filter :title
    filter :publish
    filter :access

form :html => { :enctype => "multipart/form-data" } do |f|
   f.inputs "Details" do
    f.input :title
    f.label :content
    f.rich_text_area :content, as: :action_text
    f.input :publish
    f.input :access #public = 1, private = 0
    f.input :link
    f.input :video, as: :file
    f.input :images, as: :file, input_html:{ multiple: true}, required: true
  end
  f.actions
 end

# show do
#     attributes_table do
#       row :images do |article| 
#         ul do
#           article.images.each do |image|
#             span image_tag(image, width: 100)
#           end
#         end
#       end
#     end

#     active_admin_comments
#   end
  permit_params :title, :body, :publish, :access, :link, :video, :content, :hashed_id, images: []
end
