<?php

if (!isset($argv[1])) {
    echo "You must specify the autoload.php path.";
}

if (!isset($argv[2])) {
    echo "You must specify the class name.";
}

require $argv[1];

$reflectionClass = new \ReflectionClass
