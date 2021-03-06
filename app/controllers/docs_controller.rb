class DocsController < ApplicationController

	before_action :find_doc, only: [:show, :edit, :update, :destroy]
		#we dont need it for idex of new or create. to create a documet does not require you to find that document

	def index
		@docs = Doc.all.order("created_at DESC")
	end

	def show
		@doc = Doc.find(params[:id])
	end

	def new
		@doc = Doc.new
	end

	def create
		@doc = Doc.new(doc_params)

		if @doc.save
			redirect_to @doc
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @doc.update(doc_params)
			redirect_to @doc
		else
			render 'edit'
		end
	end

	def destroy
		@doc.destroy
		redirect_to docs_path
	end

	private

		def find_doc
			@doc = Doc.find(params[:id])
		end

		def doc_params
			params.require(:doc).permit(:title, :content)
		end
	end

