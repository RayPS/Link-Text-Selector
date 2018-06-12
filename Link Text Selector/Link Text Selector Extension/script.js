document.addEventListener('DOMContentLoaded', function(event) {
    setInterval(function() {
        this.safari.extension.dispatchMessage('Hello World!');
        console.log('asdasddadasdadsdadsaddds');
    }, 1000);
});
