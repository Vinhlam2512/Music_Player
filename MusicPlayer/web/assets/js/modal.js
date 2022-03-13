function addSong(type, idSong) {
    var li = document.querySelectorAll('.modal-body ul li');
    for (let i = 0; i < li.length; i++) {
        li[i].onclick = function () {
            $.ajax({
                type: 'POST',
                url: "./update-song-playlist",
                data: {
                    idSong: idSong,
                    idPlaylist: li[i].getAttribute('data-id'),
                    type: type
                },
                success: function (resultData) {
                    console.log("update Complete");
                }
            })
        }
    }
}
