require 'spec_helper'

describe SpheroControlController do
  let(:sphero){ double("Sphero").as_null_object }
  before(:each) do
    controller.stub(:sphero).and_return(sphero)
  end
  describe 'POST #set_color' do
    it "sets the sphero color" do
      sphero.should_receive(:rgb).with(255, 0, 0)
      post :set_color, :color => "red,255,0,0"
    end
    it "redirects to home page" do
      post :set_color, :color => "red,255,0,0"
      expect(response).to redirect_to root_path
      expect(flash[:notice]).to eq("Color set to red")
    end
    it "sets the drop down list correctly" do
      #post_via_redirect :set_color, :color => "red,255,0,0"
      get(response.location :set_color, :color => "red,255,0,0")
      #debugger
      #follow_redirect!
      expect(response.response_code).to eq(200)

    end
  end
end