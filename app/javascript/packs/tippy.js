import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css';
import 'tippy.js/themes/light.css';
import 'tippy.js/dist/backdrop.css';
import 'tippy.js/animations/shift-away.css';

const days = document.querySelectorAll('.simple-calendar .day.current-month.has-events')

days.forEach((day) => {
  let buffer = "";
  const children = Array.from(day.lastElementChild.children)
  children.forEach((child) => {
    const title = child.dataset.eventTitle
    const time = child.dataset.eventTime
    buffer += `<p>
${time} - ${title}</p>`;
  })
tippy(`#${day.id}`, {
    placement: 'bottom',
    arrow: false,
    content: buffer,
    theme: 'light',
    animation: 'shift-away'
  });
})
