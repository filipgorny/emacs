<?php

namespace PhpBrowser;

class PhpBrowser
{
    public function getInstance()
    {
        return new self;
    }

    public function findClass($path, $class)
    {
        $path = realpath($path);
        $results = [];

        $objects = new \RecursiveIteratorIterator(new \RecursiveDirectoryIterator($path), \RecursiveIteratorIterator::SELF_FIRST);
        foreach($objects as $name => $object){
            $explName = explode(DIRECTORY_SEPARATOR, $name);
            $last = array_pop($explName);

            $s = str_replace(".php", "", $last);

            if ($s == $class) {
                $results[$this->getClassNameFromFile($name)] = $name;
            }
        }

        return $results;
    }

    private function getClassNameFromFile($filename)
    {
        //$body = file_get_contents($filename);
        $body = file($filename);

        $namespace = '';
        $class = '';
        
        foreach ($body as $line) {
            if (strstr($line, 'namespace')) {
                $namespace = str_replace('namespace ', '', $line);
                $namespace = str_replace([';', "\n"], '', $namespace);
            }

            if (strstr($line, 'class') && empty($class)) {
                $expl = explode(" ", $line);
                $class = $expl[1];
                $class = str_replace(['{', '', "\n"], '', $class);
            }
        }

        return $namespace.'\\'.$class;
    }
}

