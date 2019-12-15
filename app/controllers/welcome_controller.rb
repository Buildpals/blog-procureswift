class WelcomeController < ApplicationController
    
    def index
        @post = Post.all.where(draft: false)
    end
end
