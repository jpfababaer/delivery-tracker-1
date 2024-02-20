class DeliveriesController < ApplicationController
  def index
    user_id = current_user.id
    @the_deliveries = Delivery.where({ user_id: user_id})


    render({ :template => "deliveries/index" })
  end

  
  def create
    the_delivery = Delivery.new
    the_delivery.description = params.fetch("query_description")
    the_delivery.supposed_to_arrive_on = params.fetch("query_date")
    the_delivery.details = params.fetch("query_details")
    the_delivery.user_id = params.fetch("query_user_id")
    the_delivery.arrived = params.fetch("query_arrived")
    
    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries", { :notice => "Added to list" })
    else
      redirect_to("/deliveries", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end
  
  def update
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)
    
    the_delivery.arrived = params.fetch("arrived")
    
    if the_delivery.valid?
      the_delivery.save
      redirect_to("/deliveries/#{the_delivery.id}", { :notice => "Delivery updated successfully."} )
    else
      redirect_to("/deliveries/#{the_delivery.id}", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end
  
  def destroy
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)
    
    the_delivery.destroy
    
    redirect_to("/deliveries", { :notice => "Delivery deleted successfully."} )
  end

  # def show
  #   the_id = params.fetch("path_id")
  
  #   matching_deliveries = Delivery.where({ :id => the_id })
  
  #   @the_delivery = matching_deliveries.at(0)
  
  #   render({ :template => "deliveries/show" })
  # end
end
