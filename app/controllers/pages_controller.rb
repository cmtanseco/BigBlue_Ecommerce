class PagesController < InheritedResources::Base
  http_basic_authenticate_with name: "ctanseco", password: "bigblue"
  private

    def page_params
      params.require(:page).permit(:title, :content, :permalink)
    end
end

