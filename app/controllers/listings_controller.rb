class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]


    def index
        @listings = Listing.all
    end

    def show
        @listing = Listing.find(params[:id])
        @breed = Breed.all
    end

    def new
        @listing = Listing.new
        @breeds = Breed.all
        @sexes = Listing.sexes.keys
    end

    def create
        #finish logic for creating a record
        @listing = Listing.create(listing_params)
        if @listing.errors.any?
            @breeds = Breed.all
            @sexes = Listing.sexes.keys
            render "new"
        else
            redirect_to listings_path
        end
    end

    def edit
    end

    def update
        #finish logic for updating the record
    end

    def destroy
        
        #finish logic for deleting the record
    end

    private

    def set_listing
        @listing = Listing.find(params[:id])
    end

    def listing_params
        params.require(:listing).permit(:title, :description, :breed_id, :sex, :city, :state, :price, :deposit, :date_of_birth, :diet, :picture)
    end
    

end