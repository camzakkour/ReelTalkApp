# ReelTalk by Cameron Zakkour

## Welcome Page


<img src="https://github.com/camzakkour/ReelTalkApp/assets/97917230/1b54bee4-6739-4495-b0cd-9e4281df56bf" width="170" height="350"/>
<img src="https://github.com/camzakkour/ReelTalkApp/assets/97917230/8d41ffec-17a4-4556-aeea-0d2f9095378b" width="170" height="350"/>
<img src="https://github.com/camzakkour/ReelTalkApp/assets/97917230/de565c73-a26d-4e3d-aedf-8b0aec8a679c" width="170" height="350"/>

### Design
- TabView used to allow seamless scrolling of pages for the User
- dotAppearance is used to indicate to the user which page of the TabView they are on
- Continue button is only shown when the user is on the last page of the TabView
### Date Structure
- All data stored for each page of the Welcome Page is stored in the WelcomeViewModel which contains a structure for each page with values such as the image and description that the user can see
### Steps
- User must simply swipe through the screen to reveal the different pages to eventually end up on the last page
- Once on the last page of the screen, the user can press the "Continue" button to carry on to the next section

## Genre Page

<img src="https://github.com/camzakkour/ReelTalkApp/assets/97917230/1f7f060a-49d7-4d4b-b480-c700562d65a7" width="170" height="350"/>
<img src="https://github.com/camzakkour/ReelTalkApp/assets/97917230/fd89b471-947f-415c-9baa-9c440ecd2ee0" width="170" height="350"/>

### Design
- The Genre page is made up of mutliple types of VStacks to align the different components that make up the page
- The main attraction of the page is the List of genres to make it easy for the user to scroll through and find there favorite genre to select
- When the user clicks on the genre that is one of their favorites, it becomes highlighted to indicate to the user that it has been selected
### Date Structure
- The genre data is fetched in the GenreSelectionViewModel
- The structure for each genre is found in the GenreModel
### Steps
- Once the user selects 3 of their favorite genres they are able to proceed to the next section

## Movies Page

<img src="https://github.com/camzakkour/ReelTalkApp/assets/97917230/20b7c979-a781-437b-b7b7-7dd19e6f41f4" width="170" height="350"/>
<img src="https://github.com/camzakkour/ReelTalkApp/assets/97917230/1673fe64-d3a4-4b82-86d3-14224e1cff2b" width="170" height="350"/>
<img src="https://github.com/camzakkour/ReelTalkApp/assets/97917230/ea787052-7bb1-48e2-bb17-9c782faf30e3" width="170" height="350"/>

### Design
- The Movies page is made up of mutliple types of VStacks to align the different components that make up the page
- In the center of the page is a LazyVGrid in a ScrollView, this allows the user to clearly see all of the movies listed in 2 columns
- When the user clicks on the movie that is one of their favorites, a border and checkmark is shown on the image of the movie to indicate to the user that it was selected
- The image, title, and year of each movie is made up in a card, found in the MoviesCardView
- The user is also able to search for a movie title by typing the title into the searchbar which the user will then be able to select
### Date Structure
- The movies are fetched in the TopMoviesViewModel
- The structure for each movie is found in the MoviesModel
### Steps
- Once the user selects 5 of their favorite movies they are able to proceed to the next section

## Shows Page

<img src="https://github.com/camzakkour/ReelTalkApp/assets/97917230/54dd74df-f60d-478d-962c-6cf85312d12c" width="170" height="350"/>
<img src="https://github.com/camzakkour/ReelTalkApp/assets/97917230/c791592e-c07a-480f-9889-be1402112bfd" width="170" height="350"/>
<img src="https://github.com/camzakkour/ReelTalkApp/assets/97917230/98d4b693-3126-417a-b92b-9c3b7d8d8c25" width="170" height="350"/>

### Design
- The Shows page is made up of mutliple types of VStacks to align the different components that make up the page
- In the center of the page is a LazyVGrid in a ScrollView, this allows the user to clearly see all of the shows listed in 2 columns
- When the user clicks on the show that is one of their favorites, a border and checkmark is shown on the image of the show to indicate to the user that it was selected
- The image, title, and year of each show is made up in a card, found in the ShowsCardView
- The user is also able to search for a show title by typing the title into the searchbar which the user will then be able to select
### Date Structure
- The shows are fetched in the TopShowsViewModel
- The structure for each movie is found in the ShowsModel
### Steps
- Once the user selects 5 of their favorite shows they are able to proceed to the next section

## Be Kind Page

<img src="https://github.com/camzakkour/ReelTalkApp/assets/97917230/d21a3bbd-f9c8-4506-9065-75a8ddc85531" width="170" height="350"/>

### Design
- The Be Kind page is in a simple VStack of all the components that make up the screen
### Steps
- End of demo
