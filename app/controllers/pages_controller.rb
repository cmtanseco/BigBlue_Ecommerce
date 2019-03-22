class PagesController < InheritedResources::Base
  http_basic_authenticate_with name: "ctanseco", password: "bigblue"

  def home
    @page = Page.find_by(permalink: 'home')
  end

  def ca
    @page = Page.find_by(permalink: params[:permalink])
  end

  private

    def page_params
      params.require(:page).permit(:title, :content, :permalink)
    end
end

