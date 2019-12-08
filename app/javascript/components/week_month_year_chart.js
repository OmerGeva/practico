const week_button = document.querySelector("#week_button")
const month_button = document.querySelector("#month_button")
const year_button = document.querySelector("#year_button")

// const num_of_check_ins = week_button.dataset['week'];

console.log(week_button.dataset);
console.log(month_button.dataset);
console.log(year_button.dataset);

var data1 = []
var data2 = []
var data3 = []

var counter = 0
for (var key in week_button.dataset) {
    data1[counter] = { group: key.slice(4, key.length), value: week_button.dataset[key] };
    counter += 1;
     }
counter = 0
for (var key in month_button.dataset) {
    data2[counter] = { group: key.slice(5, key.length), value: month_button.dataset[key] };
    counter += 1;
     }
counter = 0
for (var key in year_button.dataset) {
    data3[counter] = { group: key.slice(4, key.length), value: year_button.dataset[key] };
    counter += 1;
     }
const back_card = document.querySelector("#graph-challenge-card")

// set the dimensions and margins of the graph
var margin = {top: 20, right: 30, bottom: 10, left: 30},
width = back_card.offsetWidth - margin.left - margin.right,
height = back_card.offsetHeight - margin.top - margin.bottom;
// append the svg object to the body of the page

var svg = d3.select("#week_month_year")
.append("svg")
.attr("width", back_card.offsetWidth)
.attr("height", back_card.offsetHeight)
.append("g")
.attr("transform",
  "translate(" + margin.left + "," + margin.top + ")");

console.log(margin);
// X axis
var x = d3.scaleBand()
.range([ 0, width ])
.domain(data1.map(function(d) { return d.group; }))
.padding(0.2);
svg.append("g")
.attr("transform", "translate(0," + height + ")")
.call(d3.axisBottom(x))

// Add Y axis
var y = d3.scaleLinear()
.domain([0, 22])
.range([ height, 0]);
svg.append("g")
.attr("class", "myYaxis")
.call(d3.axisLeft(y));

// A function that create / update the plot for a given variable:
const update = (data) => {

  var u = svg.selectAll("rect")
  .data(data)

  u
  .enter()
  .append("rect")
  .merge(u)
  .transition()
  .duration(500)
  .attr("x", function(d) { return x(d.group); })
  .attr("y", function(d) { return y(d.value); })
  .attr("width", x.bandwidth())
  .attr("height", function(d) { return height - y(d.value); })
  .attr("fill", "#69b3a2")
}


// Initialize the plot with the first dataset
update(data1)
week_button.addEventListener(("click"), (event) => {update(data1)});
month_button.addEventListener(("click"), (event) => {update(data2)});
year_button.addEventListener(("click"), (event) => {update(data3)});

