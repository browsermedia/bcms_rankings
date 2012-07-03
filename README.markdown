# Rankings Module for BrowserCMS

This is module for BrowserCMS, which allows users to rank pages. It includes the following features:

* Rank This Page - Users can use a control on a page that allows users to rank a page from 1-5.
* Highest Ranked Pages - Users can see a list of pages which have the highest rank.

This module is primarily for demo purposes, and currently does not have any 'voter fraud' detection to prevent multiple votes. Ideally, this would need to be done client side, with a cookie, so as to keep pages cachable in the CMS.

## Installation

	
The Ranking module installs like most other BrowserCMS modules (http://guides.browsercms.org/installing_modules.html)

### 1. Install the module 

$ rails g cms:install bcms_rankings

### 2. Run the following commands

    $ rake db:migrate
  	$ rake db:seed

For projects with existing databases, you may need to comment out other lines in db/seeds.rb so only the module seed data runs.

### 3. Create a Ranking portlet and embed into your templates

* Open your browser to localhost:3000/cms/portlets and login 
* Click 'Add New Content', and select 'Rank This Page Portlet'
* Set the name to 'Rank This Page' and click save.
* Now go to Administration -> Page Templates -> Sub Page -> Edit
* Add the following line to your template, somewhere in the body (preferably after your main content area)

		<%= render_portlet "Rank This Page" %>

This will render embed the portlet named "Rank This Page" into any page which uses the Sub Page template. 

* Now add a new page using the "Sub Page" template and you should see the radio buttons to rank the page. Ranking a page will update the associated page rank.