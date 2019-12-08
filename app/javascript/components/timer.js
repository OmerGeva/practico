// Add hours to current time
Date.prototype.addHours = function(h) {
  this.setTime(this.getTime() + (h*60*60*1000));
  return this;
}

// Update the count down every 1 second
const timer = () => {
  // Start Timer
  if (document.getElementById('start') !== null) {

  const start = document.getElementById('start');
  start.addEventListener('click', getTime)
  // Stop Timer
  const stop = document.getElementById('stop')
  stop.addEventListener('click', stopTimer)
  }
}

// 1st. click hourglass and grab input

const getTime = (event) => {
  const hider = document.getElementById('hider');
  hider.classList.add("d-none");
  const amountTime = document.getElementById('numHours').value;
  const startTime = new Date().getTime();
  localStorage.setItem('startTime', startTime);
  const endTime = startTime + (parseFloat(amountTime)*60*60*1000);
  countDown(startTime, endTime);
}

// 2. place input and start timer

const countDown = (startTime, endTime) => {
  document.timer = setInterval(timerInterval, 1000, startTime, endTime);
}

const timerInterval = (startTime, endTime) => {
  const now = new Date().getTime();
  const distance = endTime - now;
  const totalTime = endTime - startTime;

  const timer = document.getElementById('timer');


  if (distance <= 0) {
    stopTimer();

    timer.innerHTML = `Done!`;
    document.getElementById('timer-circle').setAttribute("stroke-dasharray", `0, 100`);
    return console.log('done');
  }

  // Time calculations for days, hours, minutes and seconds
  const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  const seconds = Math.floor((distance % (1000 * 60)) / 1000);

  console.log(hours, minutes, seconds);
  timer.innerHTML = `${hours}:${minutes}:${seconds}`;

  // Circle Percentage
  const percentage = (distance / totalTime) * 100;
  document.getElementById('timer-circle').setAttribute("stroke-dasharray", `${percentage}, 100`);
}

// event listener for stop button on click
const stopTimer = (event) => {
  // clearInterval
  clearInterval(document.timer);
  // take currentTime of stop button click
  const now = new Date().getTime();
  const startTime = localStorage.getItem('startTime');
  // subtract local storage startTime from currentTime store as elapsedTime
  const elapsedTime = now - startTime;
  console.log((elapsedTime / 3600000).toPrecision(2));
  const submitTime = document.getElementById('check_in_duration');
  // setting numHours.value to elapsedTime and submitting
  submitTime.value = (elapsedTime / 3600000).toPrecision(4);
}

export { timer };
