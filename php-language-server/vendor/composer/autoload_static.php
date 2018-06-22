<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit8ea62fbbfc2f0fa34ddbe605096dcd50
{
    public static $files = array (
        '383eaff206634a77a1be54e64e6459c7' => __DIR__ . '/..' . '/sabre/uri/lib/functions.php',
        '2b9d0f43f9552984cfa82fee95491826' => __DIR__ . '/..' . '/sabre/event/lib/coroutine.php',
        'd81bab31d3feb45bfe2f283ea3c8fdf7' => __DIR__ . '/..' . '/sabre/event/lib/Loop/functions.php',
        'a1cce3d26cc15c00fcd0b3354bd72c88' => __DIR__ . '/..' . '/sabre/event/lib/Promise/functions.php',
        'caf3abc48ff070873ebdd8b0b3e3ed61' => __DIR__ . '/..' . '/felixfbecker/language-server/src/utils.php',
        '9bf3e7d6fe9641970dc01b8d6883ca73' => __DIR__ . '/..' . '/felixfbecker/language-server/src/FqnUtilities.php',
        '8e586103bb738bdd52591d2da31dd349' => __DIR__ . '/..' . '/felixfbecker/language-server/src/ParserHelpers.php',
    );

    public static $prefixLengthsPsr4 = array (
        'p' => 
        array (
            'phpDocumentor\\Reflection\\' => 25,
        ),
        'W' => 
        array (
            'Webmozart\\PathUtil\\' => 19,
            'Webmozart\\Glob\\' => 15,
            'Webmozart\\Assert\\' => 17,
        ),
        'S' => 
        array (
            'Sabre\\Uri\\' => 10,
            'Sabre\\Event\\' => 12,
        ),
        'P' => 
        array (
            'Psr\\Log\\' => 8,
        ),
        'M' => 
        array (
            'Microsoft\\PhpParser\\' => 20,
        ),
        'L' => 
        array (
            'LanguageServer\\' => 15,
        ),
        'C' => 
        array (
            'Composer\\XdebugHandler\\' => 23,
        ),
        'A' => 
        array (
            'AdvancedJsonRpc\\' => 16,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'phpDocumentor\\Reflection\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpdocumentor/reflection-common/src',
            1 => __DIR__ . '/..' . '/phpdocumentor/type-resolver/src',
            2 => __DIR__ . '/..' . '/phpdocumentor/reflection-docblock/src',
        ),
        'Webmozart\\PathUtil\\' => 
        array (
            0 => __DIR__ . '/..' . '/webmozart/path-util/src',
        ),
        'Webmozart\\Glob\\' => 
        array (
            0 => __DIR__ . '/..' . '/webmozart/glob/src',
        ),
        'Webmozart\\Assert\\' => 
        array (
            0 => __DIR__ . '/..' . '/webmozart/assert/src',
        ),
        'Sabre\\Uri\\' => 
        array (
            0 => __DIR__ . '/..' . '/sabre/uri/lib',
        ),
        'Sabre\\Event\\' => 
        array (
            0 => __DIR__ . '/..' . '/sabre/event/lib',
        ),
        'Psr\\Log\\' => 
        array (
            0 => __DIR__ . '/..' . '/psr/log/Psr/Log',
        ),
        'Microsoft\\PhpParser\\' => 
        array (
            0 => __DIR__ . '/..' . '/microsoft/tolerant-php-parser/src',
        ),
        'LanguageServer\\' => 
        array (
            0 => __DIR__ . '/..' . '/felixfbecker/language-server/src',
        ),
        'Composer\\XdebugHandler\\' => 
        array (
            0 => __DIR__ . '/..' . '/composer/xdebug-handler/src',
        ),
        'AdvancedJsonRpc\\' => 
        array (
            0 => __DIR__ . '/..' . '/felixfbecker/advanced-json-rpc/lib',
        ),
    );

    public static $prefixesPsr0 = array (
        'J' => 
        array (
            'JsonMapper' => 
            array (
                0 => __DIR__ . '/..' . '/netresearch/jsonmapper/src',
            ),
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit8ea62fbbfc2f0fa34ddbe605096dcd50::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit8ea62fbbfc2f0fa34ddbe605096dcd50::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInit8ea62fbbfc2f0fa34ddbe605096dcd50::$prefixesPsr0;

        }, null, ClassLoader::class);
    }
}
