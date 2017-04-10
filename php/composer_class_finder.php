<?php

$inputDataDefinition = [
    1 => [
        'error' => 'Please procide a composer project path',
    ],
    2 => [
        'error' => 'Please provide a desired method to run.'
    ],
    3 => [
        'error' => 'Please provide a parameter for the method'
    ]
];

function showError($info) {
    echo $info."\n";
    exit(1);
}

function output($content) {
    echo $content;
    exit(0);
}

foreach ($inputDataDefinition as $index => $info) {
    if (!isset($argv[$index])) {
        showError($info['error']);
    }
}

$composerDirectory = $argv[1];
$autoloadPath = $composerDirectory.'/vendor/autoload.php';

if (!file_exists($autoloadPath)) {
    showError('Could not locate autoload.php file, tried path: '.$autoloadPath);
}

require $autoloadPath;

switch ($argv[2]) {
    case 'find-class':
        $reflectionClass = new ReflectionClass($argv[3]);
        output($reflectionClass->getFileName());
        break;
}
