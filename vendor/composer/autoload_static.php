<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitf0d8785e26ab5820d15f2ab95e003988
{
    public static $prefixLengthsPsr4 = array (
        'T' => 
        array (
            'Twig\\' => 5,
            'TelegramBot\\Api\\' => 16,
        ),
        'M' => 
        array (
            'Mbh\\' => 4,
        ),
        'A' => 
        array (
            'App\\' => 4,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Twig\\' => 
        array (
            0 => __DIR__ . '/..' . '/twig/twig/src',
        ),
        'TelegramBot\\Api\\' => 
        array (
            0 => __DIR__ . '/..' . '/telegram-bot/api/src',
        ),
        'Mbh\\' => 
        array (
            0 => __DIR__ . '/..' . '/mbh-framework/rest/Mbh',
            1 => __DIR__ . '/..' . '/mbh-framework/mvc/Mbh',
            2 => __DIR__ . '/..' . '/mbh-framework/firewall/Mbh',
        ),
        'App\\' => 
        array (
            0 => __DIR__ . '/../..' . '/app',
        ),
    );

    public static $prefixesPsr0 = array (
        'T' => 
        array (
            'Twig_' => 
            array (
                0 => __DIR__ . '/..' . '/twig/twig/lib',
            ),
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitf0d8785e26ab5820d15f2ab95e003988::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitf0d8785e26ab5820d15f2ab95e003988::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInitf0d8785e26ab5820d15f2ab95e003988::$prefixesPsr0;

        }, null, ClassLoader::class);
    }
}
