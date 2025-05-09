<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 * 
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

define ('WP_HOME', 'https://ENV_DB_DOMAIN');
define ('WP_SITEURL', 'https://ENV_DB_DOMAIN');

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'ENV_DB_NAME' );

/** Database username */
define( 'DB_USER', 'ENV_DB_USER' );

/** Database password */
define( 'DB_PASSWORD', 'ENV_DB_PASSWORD' );

/** Database hostname */
define( 'DB_HOST', 'ENV_DB_HOST' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '=+W$F[AMXRSI*J1%~/@on,HLP*X?87a<)H]gC6*o3lBp.:75ua>dD6_o#Rv$ W,M' );
define( 'SECURE_AUTH_KEY',  '!OigJ7I+c#M9V|5e0pEYg) okl-9 8<IJE?BhtGRX?WM$#X/NH.&#bKlkFQ2Izum' );
define( 'LOGGED_IN_KEY',    'hSBBF8`=* dIHTpigDN?r.x^>Y)Ies9-/I f{S&B)UrW*$.^4el,hs$iGMl<>3 (' );
define( 'NONCE_KEY',        '+]O #c(T-M[m6i7.wgi)G{bCh|B-58!DRsKHv,xsDE#QF7eR;]XY!fWy8)LkohR/' );
define( 'AUTH_SALT',        '|0nP$;01/[4$ 8g;*z2X:(,?H*72A:Ock3=b(-49>]&W~7G-E;kOkbsBdnd;M*BL' );
define( 'SECURE_AUTH_SALT', '?Q4<Q=Q%[XhCz]k|C+ftSSt-3Qu47 G-3D*M}y*U,9-iZIK@26N.jb~$@HlBtsJI' );
define( 'LOGGED_IN_SALT',   ':V1WzWB_S-YO^a[nCk^nYRI3rkMS;:&Q(J/|Zx9pd[Touc535xq4n(Wir1;?/Lo[' );
define( 'NONCE_SALT',       'P07XV|*/?FHS3N/BC97>@6Em}lqhVojCqiq9^o$2V~?+WxT2_)_]L<VA%Bl&st77' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';