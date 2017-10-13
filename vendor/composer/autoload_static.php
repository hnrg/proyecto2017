<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit0f812334c38415a671be991434a1b56c
{
    public static $prefixLengthsPsr4 = array (
        'T' => 
        array (
            'Twig\\' => 5,
        ),
        'M' => 
        array (
            'Mbh\\' => 4,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Twig\\' => 
        array (
            0 => __DIR__ . '/..' . '/twig/twig/src',
        ),
        'Mbh\\' => 
        array (
            0 => __DIR__ . '/..' . '/mbh-framework/rest/Mbh',
            1 => __DIR__ . '/..' . '/mbh-framework/mvc/Mbh',
            2 => __DIR__ . '/..' . '/mbh-framework/firewall/Mbh',
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
            $loader->prefixLengthsPsr4 = ComposerStaticInit0f812334c38415a671be991434a1b56c::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit0f812334c38415a671be991434a1b56c::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInit0f812334c38415a671be991434a1b56c::$prefixesPsr0;

        }, null, ClassLoader::class);
    }
}
