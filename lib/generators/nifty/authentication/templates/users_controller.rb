class <%= user_plural_class_name %>Controller < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def new
    @<%= user_singular_name %> = <%= user_class_name %>.new
  end

  def create
    @<%= user_singular_name %> = <%= user_class_name %>.new(params[:<%= user_singular_name %>])
    if @<%= user_singular_name %>.save
    <%- unless options[:authlogic] -%>
      session[:<%= user_singular_name %>_id] = @<%= user_singular_name %>.id
    <%- end -%>
      redirect_to root_url, :notice => "Thank you for signing up! You are now logged in."
    else
      render :new
    end
  end

  def edit
    @<%= user_singular_name %> = current_<%= user_singular_name %>
  end

  def update
    @<%= user_singular_name %> = current_<%= user_singular_name %>
    if @<%= user_singular_name %>.update_attributes(params[:<%= user_singular_name %>])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :edit
    end
  end
end
