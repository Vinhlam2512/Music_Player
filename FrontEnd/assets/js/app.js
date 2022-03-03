
var song_image = document.querySelectorAll('.song_image');

var media_title = document.querySelectorAll('song_des-title');

var src = document.querySelectorAll('.song_des-title a audio');

song_image.forEach(e => {
    e.addEventListener('click', function() {
        src[0].play();
        console.log(1);
    })
});