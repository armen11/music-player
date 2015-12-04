<ul id="play_list">
    <?php foreach($songs as $song): ?>
        <li class="ui-widget-content" data-genre="<?php echo $song['genre_id']; ?>">
            <span><?php echo $song['name']; ?></span>
            -
            <span><b><?php echo $song['title']; ?></b></span>
        </li>
    <?php endforeach; ?>
</ul>