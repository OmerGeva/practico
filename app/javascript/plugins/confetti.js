if (document.URL.match(/challenges\/\d+\/finished/)) {

var end = Date.now() + (15 * 1000);

var interval = setInterval(function() {
    if (Date.now() > end) {
        return clearInterval(interval);
    }

    confetti({
        startVelocity: 30,
        spread: 360,
        ticks: 60,
        shapes: ['square'],
        origin: {
            x: Math.random(),
            // since they fall down, start a bit higher than random
            y: Math.random() - 0.2
        }
    });
}, 200);
}
