document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const placeFormEl = document.getElementById("sf-place");
  placeFormEl.addEventListener("submit", event => {
    event.preventDefault();

    const placeNameInputEl = document.querySelector(".favorite-input");
    const placeName = placeNameInputEl.value;
    placeNameInputEl.value = "";

    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = placeName;

    ul.appendChild(li);
  });


  // adding new photos

  // --- your code here!
  const showPhotoForm = (event) => {
    const photoFormDiv = document.querySelector(".photo-form-container");
    if (photoFormDiv.className === "photo-form-container") {
      photoFormDiv.className = "photo-form-container hidden";
    } else {
      photoFormDiv.className = "photo-form-container";
    }
  };

  const photoFormShowButton = document.querySelector(".photo-show-button");
  photoFormShowButton.addEventListener("click", showPhotoForm);

  const handlePhotoSubmit = (event) => {
    event.preventDefault();

    const urlInput = document.querySelector(".photo-url-input");
    const photoUrl = urlInput.value;
    urlInput.value = "";

    const photoImage = document.createElement("img");
    photoImage.src = photoUrl;

    const photoList = document.createElement("li");
    photoList.appendChild(photoImage);

    const photoUl = document.querySelector(".dog-photos");
    photoUl.appendChild(photoList);

  };

  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener("click", handlePhotoSubmit);


});
