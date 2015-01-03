---
title: Secure passwords in Yii2 framework
publishDate: "2015-01-03"
categories:
- yii2
- secure
- passwords
---
_Recently I contributed a Yii2 framework solution to the [SecurePasswords.info](http://SecurePasswords.info) project, I wanted to share this here as well._


Yii2 Framework ships with support for [`crypt()`](http://php.net/crypt) and [`ext/password`](http://php.net/password) via it's security component.

## Installation
Yii2 security comes installed with a yii2 composer install, nothing special is required.

## Usage

By default Yii2 uses `crypt()` for hashing, but if you have PHP >= 5.5.0 we recommend you use `ext/password` by adding the following in your `config/web.php` file.

~~~php
<?php
return [
  ...
  'components' => [
    ...
    'security' => [
      'passwordHashStrategy' => 'password_hash'
      ...
      ]
      ]
    ];
~~~

For more security documentation please visit [Yii2 Security - Passwords](http://stuff.cebe.cc/yii2docs/guide-security-passwords.html)

## Hashing passwords

~~~php
$hash = Yii::$app->getSecurity()->generatePasswordHash($password);
~~~

## Verifying a password

~~~php
if (Yii::$app->getSecurity()->validatePassword($password, $hash)) {
// all good, logging user in
} else {
  // wrong password
}
~~~

[SecurePasswords.info - Yii2 Framework](http://securepasswords.info/yii2-framework/)
