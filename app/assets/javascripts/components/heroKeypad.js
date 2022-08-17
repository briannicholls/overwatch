console.log('** Loaded heroKeypad.js **')

function defer(method) {
  if (document.getElementsByClassName('hero-checkbox').length > 0) {
    method();
  } else {
    setTimeout(function() { defer(method) }, 50);
  }
}

function setImages() {
  let heroCheckboxes = document.getElementsByClassName('hero-checkbox')
  Array.from(heroCheckboxes).forEach( checkbox => {
    let heroName = checkbox.innerText
    // debugger
    // checkbox.style.backgroundImage = "url(../images/" + heroName.toLowerCase() + ".png)"
  })
}

defer(setImages)