function show(id) {
  var pages = document.querySelectorAll(".page");
  for (var i = 0; i < pages.length; i++) {
    pages[i].classList.remove("active");
  }
  document.getElementById(id).classList.add("active");
  window.scrollTo(0, 0);
}
