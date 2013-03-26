<?php //print_r($form); ?>
<div class="form" id="contactwidget">

    <div class="inp_l">
        <div class="inp_r">
            <?php print drupal_render($form['firstname']); ?>
        </div>
    </div>

</div>
<?php print drupal_render_children($form); ?>
