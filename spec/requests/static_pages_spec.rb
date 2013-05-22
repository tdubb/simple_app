require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
  
    it "should have the h1 'Hi'" do
    	visit root_path
    	page.should have_selector('h1', text: 'Hi')
      
    end

    it "should have the title 'Home'" do 
      visit root_path
      page.should have_selector('title',
                          text: "Bali | Home")
    end 

    describe "for signed-in users" do 
      let(:user) { FactoryGirl.create(:user) }
      before do 
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do 
        user.feed.each do |item|
          page.should have_selector("li#{item.id}", text: item.content)
        end
      end
    end
  end

  describe "Help page" do

  	it "should have the h1 'Do you need help'" do 
  	  visit help_path
  	  page.should have_selector('h1', text: 'Do you need help?')
  	end

    it "should have the right title 'Help'" do 
      visit help_path
      page.should have_selector('title',
                          text: "Bali | Help" )
    end 
  end	 

  describe "About page" do 

    it "should have the h1 'About my project'" do 
      visit about_path 
      page.should have_selector('h1', text: 'About my project')
    end

    it "should have the right title 'About'" do 
      visit about_path
      page.should have_selector('title',
                          text: "Bali | About")
    end  
  end  

  describe "Contact page" do 

    it "should have the h1 'Contact Me'" do 
      visit contact_path
      page.should have_selector('h1', text: 'Contact Me')
    end

    it "should have the right title 'Contact Me'" do 
      visit contact_path
      page.should have_selector('title',
                          text: "Bali | Contact Me")
    end 
  end    
end
