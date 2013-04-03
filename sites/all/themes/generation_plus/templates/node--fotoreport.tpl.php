<?php if ($title): ?>
    <h1 class="title" id="page-title">
        <?php print $title; ?>
    </h1>
<?php endif; ?>

<div class="photo-gallery">

<?php
    $mainPhoto = $content['field_report_main_foto']['#items'][0];
    $photos = $content['field_report_foto']['#items'];
    array_unshift($photos, $mainPhoto);

    foreach ($photos as $i => $photo) {

        $class = $i % 4 ? '' : 'first';

        $image_settings = array(
            'style_name' => 'photoreport_small',
            'path' => $photo['uri'],
            'alt' => $photo['alt'],
            'title' => $photo['title'],
            'getsize' => FALSE,
        );
        print ('<a href="'.file_create_url($photo['uri']).'" rel="gallery" class="fancybox ' . $class . '">'.theme_image_style($image_settings).'</a>');
    }
?>

</div>