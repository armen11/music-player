/**
 *
 */

+function($){

    var toggle = '.genres-list .genre-item-options';

    var Genre = function(){
        
    };
    
    Genre.prototype.change = function (e) {
        debugger;
    };

    // DATA API
    //$(document).on('change', toggle, Genre.prototype.change);

}(jQuery);

$(document).ready(function(){
    $(document).on('change', '.genres-list .genre-item-options', function(e){
        var list = {};

        $('.genres-list').find('.genres-list-item .genre-item-options').each(function(i, v){
            v = $(v);

            if(parseInt(v.val()) !== 0){
                list[v.closest('.genres-list-item').data('genreId')] = v.val();
            }
        });

        $.ajax({
            method: "POST",
            url: g.baseUrl + '/home/get',
            data: {
                play_list: list
            },
            success: function(html){
                $('#live_stream').html(html);
                $('#played_list').empty();
                $('main').show();
                $('.live').show();

                var current = $('#play_list li:first');
                var name = current.find('span:first').text();
                var genre = current.find('span:last b').text();
                var genre_id = current.data('genre');

                current.remove();

                $('.current-song-panel #name').text(name);
                $('.current-song-panel #genre b').text(genre);
                $('.current-song-panel #genre_id').val(genre_id);
                $('#player').attr('src', g.baseUrl + '/music/' + name + '.mp3');
                $('#player').show();
                $('.played').show();

                document.getElementById('player').play();
            }
        });
    });

    $('#next').click(function(e){
        e.stopPropagation();
        var livelist = $('#play_list li').length;
        if(livelist > 0) {
            if(livelist == 1){
                $(e.target).attr('disabled', 'disabled');
            }
            document.getElementById('player').pause();

            var name = $('.current-song-panel #name').text();
            var genre = $('.current-song-panel #genre b').text();
            var genre_id = $('.current-song-panel #genre_id').val();

            var history = '<li class="ui-widget-content" data-genre="' + genre_id + '" style="display: none">'
                            + '<span>' + name + '</span> - '
                            + '<span><b>' + genre + '</b></span>'
                            + '<span class="glyphicon glyphicon-play"></span>'
                        + '</li>';

            if ($('#played_list li').length > 0) {
                $('#played_list li:first').before(history);
            } else {
                $('#played_list').append(history);
            }

            var current = $('#play_list li:first');
            name = current.find('span:first').text();
            genre = current.find('span:last b').text();
            genre_id = current.data('genre');
            current.remove();

            $('.current-song-panel #name').text(name);
            $('.current-song-panel #genre b').text(genre);
            $('.current-song-panel #genre_id').val(genre_id);
            $('#player').attr('src', g.baseUrl + '/music/' + name + '.mp3');

            $('#played_list li:first').show();
            document.getElementById('player').play();
        }
    });

    $(document).on('click', '#played_list li .glyphicon-play', function(e){
        e.stopPropagation();

        var parent = $(e.target).parent();
        var livelist = $('#play_list li').length;
        var audio = document.getElementById('player');
        var index = 0;

        $('#played_list li').each(function(i, v){
            if($(v).find('span:first').text() == parent.find('span:first').text()){
                index = i;
                return false;
            }
        });

        if(livelist < 3 || index > 2){
            document.getElementById('player').pause();

            var name = $('.current-song-panel #name').text();
            var genre = $('.current-song-panel #genre b').text();
            var genre_id = $('.current-song-panel #genre_id').val();

            var history = '<li class="ui-widget-content" data-genre="' + genre_id + '" style="display: none">'
                            + '<span>' + name + '</span> - '
                            + '<span><b>' + genre + '</b></span>'
                            + '<span class="glyphicon glyphicon-play"></span>'
                        + '</li>';

            if ($('#played_list li').length > 0) {
                $('#played_list li:first').before(history);
            } else {
                $('#played_list').append(history);
            }

            name = parent.find('span:first').text();
            genre = parent.find('b').text();
            genre_id = parent.data('data');
            parent.remove();

            $('.current-song-panel #name').text(name);
            $('.current-song-panel #genre b').text(genre);
            $('.current-song-panel #genre_id').val(genre_id);
            $('#player').attr('src', g.baseUrl + '/music/' + name + '.mp3');

            $('#played_list li:first').show();
            document.getElementById('player').play();
        } else {
            alert('Song can be “played” only after at least 3 another Songs');
        }
    });
});