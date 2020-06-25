class WelcomeController < ApplicationController
	def index
		@articulos = Article.all
	end
	def contacto
		@email = "ein_uno@hotmail.com"
	end
end
