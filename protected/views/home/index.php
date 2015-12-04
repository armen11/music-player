<div class="row">
    <aside class="col-sm-3 col-md-2 sidebar">
        <div class="genres">
            <div class="genres-list">
                <?php foreach ($genres as $key => $item): ?>
                    <div class="genres-list-item" data-genre-id="<?php echo $item->id; ?>">
                        <span class="genre-item-name"><?php echo $item->title; ?></span>
                        <select class="genre-item-options">
                            <?php foreach ($genreValues as $value): ?>
                                <option> <?php echo $value; ?></option>
                            <?php endforeach;?>
                        </select>
                    </div>
                <?php endforeach;?>
            </div>
        </div>
    </aside>
    <main class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3" style="display: none">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 current-song-panel">
                <span id="name"></span> -
                <span id="genre"><b></b></span>
                <input type="hidden" id="genre_id">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-md-offset-3 ">
                <audio id="player" style="display: none;" controls></audio>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-4">
                <button class="btn btn-lg btn-success" id="next">NEXT</button>
            </div>
        </div>
        <div class="bottom-position">
            <div class="row">
                <div class="col-sm-6 col-md-6">
                    <div class="live" style="display: none;">
                        <div class="header">
                            Live Stream
                        </div>
                        <div class="body" id="live_stream">

                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6">
                    <div class="played" style="display: none;">
                        <div class="header">
                            Played
                        </div>
                        <div class="body" id="played_stream">
                            <ul id="played_list"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>