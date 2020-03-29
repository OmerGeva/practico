//CHECK IN WITH CHECKBOX THEN PHOTO

document.querySelector('.check-box').addEventListener('click', event => {
  event.target.style.display = "none";
  document.querySelector('.check-title').style.display = 'none';
  // If uncomment - gives a mistake in console:
  // document.querySelector('#photo-uploader').style.display="";
  document.querySelector('.after-check-in').style.width = '100%';
});



//circle start
if (document.querySelector('.e-c-progress')) {
let progressBar = document.querySelector('.e-c-progress');
let indicator = document.getElementById('e-indicator');
let pointer = document.getElementById('e-pointer');
let length = Math.PI * 2 * 100;

progressBar.style.strokeDasharray = length;

function update(value, timePercent) {
  var offset = - length - length * value / (timePercent);
  progressBar.style.strokeDashoffset = offset;
  pointer.style.transform = `rotate(${360 * value / (timePercent)}deg)`;
};

//circle ends
const displayOutput = document.querySelector('.display-remain-time')
const pauseBtn = document.getElementById('pause');
const setterBtns = document.querySelectorAll('button[data-setter]');

let intervalTimer;
let timeLeft;
let wholeTime = 5; // manage this to set the whole time
let isPaused = false;
let isStarted = false;


update(wholeTime,wholeTime); //refreshes progress bar
displayTimeLeft(wholeTime);

function changeWholeTime(seconds){
  if ((wholeTime + seconds) > 0){
    wholeTime += seconds;
    update(wholeTime,wholeTime);
    console.log(wholeTime);
  }
}

for (var i = 0; i < setterBtns.length; i++) {
    setterBtns[i].addEventListener("click", function(event) {
      event.preventDefault()
        var param = this.dataset.setter;
        switch (param) {
            case 'minutes-plus':
                changeWholeTime(1 * 60);
                break;
            case 'minutes-minus':
                changeWholeTime(-1 * 60);
                break;
            case 'seconds-plus':
                changeWholeTime(1);
                break;
            case 'seconds-minus':
                changeWholeTime(-1);
                break;
        }
      displayTimeLeft(wholeTime);
    });
}

function timer (seconds){ //counts time, takes seconds
  let remainTime = Date.now() + (seconds * 1000);
  displayTimeLeft(seconds);

  intervalTimer = setInterval(function(){
    timeLeft = Math.round((remainTime - Date.now()) / 1000);
    if(timeLeft < 0){
      clearInterval(intervalTimer);
      isStarted = false;
      setterBtns.forEach(function(btn){
        btn.disabled = false;
        btn.style.opacity = 1;
      });
      displayTimeLeft(wholeTime);
      pauseBtn.classList.remove('pause');
      pauseBtn.classList.add('play');
      return ;
    }
    displayTimeLeft(timeLeft);
  }, 1000);
}
function pauseTimer(event){
  event.preventDefault()
  if(isStarted === false){
    timer(wholeTime);
    isStarted = true;
    this.classList.remove('play');
    this.classList.add('pause');

    setterBtns.forEach(function(btn){
      btn.disabled = true;
      btn.style.opacity = 0.5;
    });

  }else if(isPaused){
    this.classList.remove('play');
    this.classList.add('pause');
    timer(timeLeft);
    isPaused = isPaused ? false : true
  }else{
    this.classList.remove('pause');
    this.classList.add('play');
    clearInterval(intervalTimer);
    isPaused = isPaused ? false : true ;
  }
}

function displayTimeLeft (timeLeft){ //displays time on the input
  let minutes = Math.floor(timeLeft / 60);
  let seconds = timeLeft % 60;
  let displayString = `${minutes < 10 ? '0' : ''}${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
  displayOutput.textContent = displayString;

  const elapsedTime = wholeTime - timeLeft
  console.log(elapsedTime);

  if (timeLeft === 0) {
    console.log('It is done');
    postTimer(elapsedTime)
  }
  update(timeLeft, wholeTime);
}

const postTimer = (elapsedTime) => {
  const submitTime = document.getElementById('check_in_duration');
  const timerContainer = document.getElementById('timer-container');
  const photoAndSubmit = document.getElementById('photo-and-submit');
  submitTime.value = Math.round(elapsedTime / 3600 * 100) / 100 ;
  console.log(submitTime.value);
  console.log(photoAndSubmit.classList);
  timerContainer.classList.add('d-none');
  photoAndSubmit.classList.remove('d-none');
  console.log({photoAndSubmit});
}

pauseBtn.addEventListener('click',pauseTimer);
}
