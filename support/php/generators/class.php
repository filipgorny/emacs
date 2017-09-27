<?php

if (!isset($argv[1])) {
    die("Please provide a file name.");
}

$fileName = $argv[1];

if (!file_exists($fileName)) {
    die('File does not exists.');
}

function resolveNamespace($fileName)
{
    $path = realpath($fileName);
    $path = explode('src', $path);

    if (count($path) < 2) {
        throw new \RuntimeException('Cannot resolve namespace root.');
    }

    $namespaceParts = explode(DIRECTORY_SEPARATOR, $path[1]);

    array_pop($namespaceParts);
    
    $namespace = substr(implode('\\', $namespaceParts), 1);
    $namespace = str_replace('.php', '', $namespace);

    return $namespace;
}

function resolveClassName($fileName)
{
    $parts = explode(DIRECTORY_SEPARATOR, $fileName);
    $className = str_replace('.php', '', array_pop($parts));

    return $className;
}

$namespace = resolveNamespace($fileName);
$className = resolveClassName($fileName);

$body = '<?php'."\n\nnamespace $namespace;\n\nclass $className\n{\n    \n}\n\n";

echo $body;