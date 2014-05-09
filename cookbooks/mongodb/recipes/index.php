<?php
$m = new \MongoClient;

$m->library->books->remove();

$m->library->books->insert(
    [
        'author' => 'George R.R. Martin',
        'title' => 'A Song of Ice and Fire',
    ], 
    [
        'author' => 'John R.R. Tolkien',
        'title' => 'The Lord of the Rings',
    ]
);

var_dump($m->library->books->count());

