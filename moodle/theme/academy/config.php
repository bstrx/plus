<?php

$THEME->name = 'academy';
$THEME->parents = array('base');
$THEME->sheets = array(
    'core',     /** Must come first**/
    'admin',
    'blocks',
    'calendar',
    'course',
    'user',
    'dock',
    'grade',
    'message',
    'modules',
    'question',
    'css3',    /** Sets up CSS 3 + browser specific styles **/
    'academy'
);
$THEME->enable_dock = true;
