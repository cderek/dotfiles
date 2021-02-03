<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitcbdf72f468830d769be2721a6c792d2b
{
    public static $prefixLengthsPsr4 = array (
        'A' => 
        array (
            'Alfred\\Workflows\\' => 17,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Alfred\\Workflows\\' => 
        array (
            0 => __DIR__ . '/..' . '/joetannenbaum/alfred-workflow/src',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitcbdf72f468830d769be2721a6c792d2b::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitcbdf72f468830d769be2721a6c792d2b::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
