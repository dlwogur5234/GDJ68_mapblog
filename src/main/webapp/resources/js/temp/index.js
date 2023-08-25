
const slide = document.getElementsByClassName(".slide");

const slider = document.getElementById("slider");
const slidesContainer = slider.querySelector(".slides");
const images = slider.getElementsByClassName("imgslide");
const slideWidth = images[0].width;
let currentIndex = 1;

function updateSlidePosition() {
  slidesContainer.style.transform = `translateX(-${
    currentIndex * slideWidth
  }px)`;
}

function prevSlide() {
  currentIndex = (currentIndex - 1 + images.length) % images.length;
  updateSlidePosition();
}

function nextSlide() {
  currentIndex = (currentIndex + 1) % images.length;
  updateSlidePosition();
}

// Initial display
updateSlidePosition();

// Automatically move to the next slide every 5 seconds
setInterval(nextSlide, 8000);

