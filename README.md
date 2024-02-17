# docker-compose-lamp - lamp stack environment for developer

![screenshot](https://raw.githubusercontent.com/robertsaupe/docker-compose-lamp/master/.github/screenshot.png)

[Supporting](https://github.com/robertsaupe/docker-compose-lamp#supporting) |
[Features](https://github.com/robertsaupe/docker-compose-lamp#features) |
[License](https://github.com/robertsaupe/docker-compose-lamp#license) |
[Installing](https://github.com/robertsaupe/docker-compose-lamp#installing) |
[Getting started](https://github.com/robertsaupe/docker-compose-lamp#getting-started) |
[Credits](https://github.com/robertsaupe/docker-compose-lamp#credits)

## Supporting

[GitHub](https://github.com/sponsors/robertsaupe) |
[Patreon](https://www.patreon.com/robertsaupe) |
[PayPal](https://www.paypal.com/donate?hosted_button_id=SQMRNY8YVPCZQ) |
[Amazon](https://www.amazon.de/ref=as_li_ss_tl?ie=UTF8&linkCode=ll2&tag=robertsaupe-21&linkId=b79bc86cee906816af515980cb1db95e&language=de_DE)

## Features

- Apache with vhosts and SSL (<http://localhost> & <https://localhost>)
- PHP [Currently Supported Versions] (8.1.x, 8.2.x, 8.3.x)
- PHP [End of life / not recommended] (5.4.x, 5.6.x, 7.0.x, 7.1.x, 7.2.x, 7.3.x, 7.4.x, 8.0.x)
- MySQL (5.7, 8.x)
- MariaDB (lts, latest, 10.x, 10.3, 10.4, 10.5, 10.6, 10.7, 10.8, 10.9, 10.10, 10.11, 11.x, 11.0, 11.1, 11.2, 11.3-rc)
- phpMyAdmin
- XDebug
- Imagick
- Redis

## License

This software is distributed under the MIT license. Please read [LICENSE](LICENSE) for information.

## Installing

### German introduction / deutsche Einleitung

[blog.robertsaupe.de/docker-compose](https://blog.robertsaupe.de/docker-compose/)

### Requirements

- Debian/Ubuntu

```bash
sudo apt install docker
sudo apt install docker-compose
```

- Arch/Manjaro

```bash
sudo pacman -S docker
sudo pacman -S docker-compose
```

- Fedora

```bash
sudo dnf install docker
sudo dnf install docker-compose
```

- macOS
  - Install Docker Desktop according to [these instructions](https://docs.docker.com/desktop/mac/install/).

- Windows
  - Install Docker Desktop according to [these instructions](https://docs.docker.com/desktop/windows/install/).

### Service (Linux)

```bash
sudo systemctl start docker.service
sudo systemctl enable docker.service
```

### Run without root (Linux)

```bash
sudo usermod -aG docker $USER
sudo reboot
```

### Environment

```bash
git clone https://github.com/robertsaupe/docker-compose-lamp.git
cd docker-compose-lamp/
cp sample.env .env

### modify .env as needed

### builds and starts the environment:
./build.sh

### starts the environment:
./start.sh

### stops the environment:
./stop.sh
```

#### on Windows (with WSL) Explorer

```cmd
### builds and starts the environment:
build.cmd

### starts the environment:
start.cmd

### stops the environment:
stop.cmd
```

## Getting started

### Visit

#### insecure

- Dashboard
  - [http://localhost](http://localhost)

- phpMyAdmin
  - [http://localhost:8080](http://localhost:8080)

- virtual domains
  - [http://dash.localhost](http://dash.localhost)
  - [http://app.localhost](http://app.localhost)
  - [http://projects.localhost](http://projects.localhost)

##### secure

- Dashboard
  - [https://localhost](https://localhost)

- phpMyAdmin
  - [https://localhost:8443](https://localhost:8443)

- virtual domains
  - [https://dash.localhost](https://dash.localhost)
  - [https://app.localhost](https://app.localhost)
  - [https://projects.localhost](https://projects.localhost)

In order to use the above URL, you still need to change the hosts file.

### SSL (HTTPS)

Support for https domains is built-in and enabled by default.

### Virtual-Hosts

#### Linux/macOS

```bash
sudo nano /etc/hosts
```

#### Windows

You can just use Notepad for this. To do this, right-click on "Run as administrator" in the start menu. Then go to Open, show all files and navigate to the folder **C:\Windows\System32\drivers\etc**. Now you can open and edit the **hosts** file.

#### hosts-file

```text
...
127.0.0.1  dash.localhost
127.0.0.1  projects.localhost
127.0.0.1  app.localhost
...
```

### Database

#### PHP Access

```php
<?php
//some before
$db_hostname="database";
//some after
?>
```

#### MYSQL_INITDB_DIR

```text
When a container is started for the first time files in this directory with the extensions:
.sh, .sql, .sql.gz and .sql.xz
will be executed in alphabetical order.

default location is ./config/initdb
```

### Xdebug

Xdebug comes installed by default and it's version depends on the PHP version chosen in the `".env"` file.

**Xdebug versions:**

PHP <= 7.3: Xdebug 2.X.X

PHP >= 7.4: Xdebug 3.X.X

To use Xdebug you need to enable the settings in the `./config/php/php.ini` file according to the chosen version PHP.

Example:

```text
# Xdebug 2
#xdebug.remote_enable=1
#xdebug.remote_autostart=1
#xdebug.remote_connect_back=1
#xdebug.remote_host = host.docker.internal
#xdebug.remote_port=9000

# Xdebug 3
#xdebug.mode=debug
#xdebug.start_with_request=yes
#xdebug.client_host=host.docker.internal
#xdebug.client_port=9003
#xdebug.idekey=VSCODE
```

Xdebug VS Code: you have to install the Xdebug extension "PHP Debug". After installed, go to Debug and create the launch file so that your IDE can listen and work properly.

Example:

**VERY IMPORTANT:** the `pathMappings` depends on how you have opened the folder in VS Code. Each folder has your own configurations launch, that you can view in `.vscode/launch.json`

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Listen for Xdebug",
      "type": "php",
      "request": "launch",
      // "port": 9000, // Xdebug 2
      "port": 9003, // Xdebug 3
      "pathMappings": {
        // "/var/www/html": "${workspaceFolder}/www" // if you have opened VSCODE in root folder
        "/var/www/html": "${workspaceFolder}" // if you have opened VSCODE in ./www folder
      }
    }
  ]
}
```

Now, make a breakpoint and run debug.

**Tip!** After theses configurations, you may need to restart container.

### Redis

It comes with Redis. It runs on default port `6379`.

## Why you shouldn't use this stack unmodified in production

We want to empower developers to quickly create creative Applications. Therefore we are providing an easy to set up a local development environment for several different Frameworks and PHP Versions.
In Production you should modify at a minimum the following subjects:

- php handler: mod_php=> php-fpm
- secure mysql users with proper source IP limitations

## Credits

- forked from <https://github.com/sprintcube/docker-compose-lamp>
