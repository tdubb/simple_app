require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
  
    it "should have the h1 'Hi'" do
    	visit '/static_pages/home'
    	page.should have_selector('h1', :text => 'Hi')
      
    end

    it "should have the title 'Home'" do 
      visit '/static_pages/home'
      page.should have_selector('title',
                          :text => "Bali | Home")
    end  
  end

  describe "Help page" do

  	it "should have the h1 'Do you need help'" do 
  	  visit '/static_pages/help'
  	  page.should have_selector('h1', :text => 'Do you need help?')
  	end

    it "should have the right title 'Help'" do 
      visit '/static_pages/help'
      page.should have_selector('title',
                          :text => "Bali | Help" )
    end 
  end	 

  describe "About page" do 

    it "should have the h1 'About my project'" do 
      visit '/static_pages/about' 
      page.should have_selector('h1', :text => 'About my project')
    end

    it "should have the right title 'About'" do 
      visit '/static_pages/about'
      page.should have_selector('title',
                          :text => "Bali | About")
    end  
  end  

  describe "Contact page" do 

    it "should have the h1 'Contact Me'" do 
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact Me')
    end

    it "should have the right title 'Contact Me'" do 
      visit '/static_pages/contact'
      page.should have_selector('title',
                          :text => "Bali | Contact Me")
    end 
  end    
end
