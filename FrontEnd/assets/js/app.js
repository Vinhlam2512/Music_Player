var songs = document.querySelectorAll('.content_song');
var footer = document.querySelector('.footer');

var playing_bar = document.querySelector('.now-playing');
var playBtn = document.querySelector('.play');
var pauseBtn = document.querySelector('.pause');
var repeatBtn = document.querySelector('.repeat');
var randomBtn = document.querySelector('.random');
var nextBtn = document.querySelector('.next');
var prevBtn = document.querySelector('.prev');
var audio = document.querySelector('.media-left-ava a audio');
var progress = document.querySelector('#progress');

var unMuteBtn = document.querySelector('.un-mute');
var muteBtn = document.querySelector('.mute');
var progress_sound = document.querySelector('#progress-sound');
const app = {
    listRandom: [],
    currentIndex: 0,
    isPlaying: false, // check playing
    isRandom: false, // check random mode
    isRepeat: false, // check repeat mode
    currentVolume: 1,

    render: function () {
        for (let i = 0; i < songs.length; i++) {
            songs[i].addEventListener('click', function () {
                app.currentIndex = i;
                playing_bar.style.display = 'flex';
                footer.style.marginBottom = '100px';
                document.querySelector('.media-left-ava a img').src =
                    songs[i].querySelector('.song_image a img').src;
                document.querySelector('.media-title span').innerHTML = songs[
                    i
                ].querySelector('.song_des-title span').outerText;
                document.querySelector('.media-singer span').innerHTML = songs[
                    i
                ].querySelector('.song_des-singer span').outerText;
                audio.src = songs[i].querySelector('.content_song audio').src;
                setTimeout(() => {
                    audio.play();
                }, 10);
                playBtn.style.display = 'none';
                pauseBtn.style.display = 'block';
            });
        }
    },
    load: function () {
        document.querySelector('.media-left-ava a img').src =
            songs[app.currentIndex].querySelector('.song_image a img').src;
        document.querySelector('.media-title span').innerHTML = songs[
            app.currentIndex
        ].querySelector('.song_des-title span').outerText;
        document.querySelector('.media-singer span').innerHTML = songs[
            app.currentIndex
        ].querySelector('.song_des-singer span').outerText;
        audio.src = songs[app.currentIndex].querySelector(
            '.content_song audio'
        ).src;
        setTimeout(() => {
            audio.play();
        }, 10);
    },
    handleEvent: function () {
        playBtn.onclick = function () {
            audio.play();
            playBtn.style.display = 'none';
            pauseBtn.style.display = 'block';
        };
        pauseBtn.onclick = function () {
            audio.pause();
            playBtn.style.display = 'block';
            pauseBtn.style.display = 'none';
        };
        audio.ontimeupdate = function () {
            // time of song
            if (audio.duration) {
                // duration of song
                const progressPercent = Math.floor(
                    (audio.currentTime / audio.duration) * 100
                );
                progress.value = progressPercent;
            }
        };
        progress.oninput = function (e) {
            // when have change in thẻ input
            const seekTime = (audio.duration * e.target.value) / 100;
            audio.currentTime = seekTime;
        };
        nextBtn.onclick = function () {
            if (app.isRandom) {
                // isRandom = true
                app.playRandomSong(); // => play Random Song
            } else {
                app.nextSong(); // else play next song
            }
            audio.play(); // play music
            app.load(); // render lại giao diện
        };

        // khi prev song
        prevBtn.onclick = function () {
            if (app.isRandom) {
                // isRandom = true
                app.playRandomSong(); // => play Random Song
            } else {
                app.prevSong(); // else play prev song
                console.log(this.currentIndex);
            }
            audio.play(); // play music
            app.load(); // render lại giao diện
        };

        // Khi random song
        randomBtn.onclick = function (e) {
            app.isRandom = !app.isRandom; // đảo giá trị của isRandom
            randomBtn.classList.toggle('activeBtn', app.isRandom); // isRandom == true => add activeBtn , isRandom == false => dont add
        };

        // Xử lý next song khi audio ended
        audio.onended = function () {
            if (app.isRepeat) {
                // isRepeat == true
                audio.play(); // play again
            } else {
                nextBtn.click(); // else click nextBtn
            }
        };
        // Xử lý phát lại 1 song
        repeatBtn.onclick = function () {
            app.isRepeat = !app.isRepeat; // đảo giá trị của isRepeat
            repeatBtn.classList.toggle('activeBtn', app.isRepeat); // isRepeat == true => add activeBtn , isRepeat == false => dont add
        };
        unMuteBtn.onclick = function () {
            audio.volume = 0;
            unMuteBtn.style.display = 'none';
            muteBtn.style.display = 'block';
        };
        muteBtn.onclick = function () {
            audio.volume = app.currentVolume;
            unMuteBtn.style.display = 'block';
            muteBtn.style.display = 'none';
        };
        progress_sound.oninput = function (e) {
            // when have change in thẻ input
            const sound = e.target.value / 100;
            audio.volume = sound;
            app.currentVolume = sound;
        };
    },
    playRandomSong: function () {
        var songLength = songs.length;
        var newIndex;
        if (this.listRandom.length == songLength) {
            // nếu độ mảng bằng số bài hát thì clear mảng
            this.listRandom.length = 0;
        }
        if (this.listRandom.length === 0) {
            // nếu mảng rỗng thì gán mảng bằng currentIndex
            this.listRandom = [this.currentIndex];
        }
        do {
            newIndex = Math.floor(Math.random() * songLength); // random từ 0 đến this.songs.length
        } while (
            this.currentIndex == newIndex ||
            this.listRandom.includes(newIndex)
        ); // nếu newIndex = currentIndex và newIndex đãcó trong mảng thì lặp lại do

        this.currentIndex = newIndex; // gán newIndex == currentIndex
        this.listRandom.push(this.currentIndex); // đẩy currentIndex vào mảng

        console.log(this.listRandom);
        console.log(songs.length);
    },
    nextSong: function () {
        console.log(songs.length);
        this.currentIndex++; // tăng index lên 1
        if (this.currentIndex >= songs.length) {
            // nếu index vượt quá số bài hát
            this.currentIndex = 0; // index quay về 0
        }
    },
    prevSong: function () {
        this.currentIndex--; // giảm index 1
        if (this.currentIndex < 0) {
            // nếu index bé hơn 0
            this.currentIndex = songs.length - 1; // index = index có giá trị lớn nhất
        }
    },
    start: function () {
        this.render();
        this.handleEvent();
    },
};

app.start();
