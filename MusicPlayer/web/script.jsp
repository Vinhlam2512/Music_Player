
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script>
    var likeBtn = document.querySelector('.like-playing');
    var unlikeBtn = document.querySelector('.unlike-playing');
    function updateSong(type, idSong) {
        $.ajax({
            type: 'POST',
            url: "./update-song",
            data: {
                idSong: idSong,
                idUser: ${idUser},
                type: type
            },
            success: function (resultData) {
                if (type === 'insert') {
                    likeBtn.style.display = 'block';
                    unlikeBtn.style.display = 'none';

                } else {
                    likeBtn.style.display = 'none';
                    unlikeBtn.style.display = 'block';
                }
                console.log("update Complete");
            }
        })
    }
</script>
<script>
    var arr = ${listIdFavorSong};
    function heartTrigger(id) {
        if (arr.includes(id)) {
            console.log(arr.includes(id));
            likeBtn.style.display = 'block';
            unlikeBtn.style.display = 'none';
        } else {
            likeBtn.style.display = 'none';
            unlikeBtn.style.display = 'block';
        }
    }
</script>
<script>
    function trigger(type, id) {
        console.log($('.liked[data-id=' + id + ']'))
        if (type == 'unlike') {
            $('.unliked[data-id=' + id + ']').css('display', 'none')
            $('.liked[data-id=' + id + ']').css('display', 'block')
        } else {
            $('.unliked[data-id=' + id + ']').css('display', 'block')
            $('.liked[data-id=' + id + ']').css('display', 'none')
        }
    }
</script>
<script>
    function loadSongPlaylist(id) {
        window.location = 'play-list/all-song?idPlaylist=' + id;
    }
</script>
<script>
    function updatePlaylist(type, idPlaylist) {
        $.ajax({
            type: 'POST',
            url: "../update-playlist",
            data: {
                idPlaylist: idPlaylist,
                idUser: ${idUser},
                type: type
            },
            success: function (resultData) {
                console.log("Update Playlist Complete");
            }
        })
    }
</script>
<script>
    function updateSong2(type, idSong) {
        $.ajax({
            type: 'POST',
            url: "../update-song",
            data: {
                idSong: idSong,
                idUser: ${idUser},
                type: type
            },
            success: function (resultData) {
                console.log("Update Song Complete");
            }
        })
    }
</script>


