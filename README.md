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
- PHP [Currently Supported Versions] (7.4.x, 8.0.x, 8.1.x)
- PHP [End of life / not recommended] (5.4.x, 5.6.x, 7.0.x, 7.1.x, 7.2.x, 7.3.x)
- MySQL (5.7, 8.x)
- MariaDB (10.3, 10.4, 10.5, 10.6, 10.7, 10.8-rc)
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

## Getting started

### Visit

- Dashboard
  - [http://localhost](http://localhost)

- phpMyAdmin
  - [http://localhost:8080](http://localhost:8080)

- virtual domains
  - [http://app.localhost](http://app.localhost)
  - [http://projects.localhost](http://projects.localhost)

In order to use the above URL, you still need to change the hosts file.

#### Linux/macOS

```bash
sudo nano /etc/hosts
```

#### Windows

You can just use Notepad for this. To do this, right-click on "Run as administrator" in the start menu. Then go to Open, show all files and navigate to the folder **C:\Windows\System32\drivers\etc**. Now you can open and edit the **hosts** file.

### hosts-file

```text
...
127.0.0.1  app.localhost
127.0.0.1  projects.localhost
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

## Credits

- forked from <https://github.com/sprintcube/docker-compose-lamp>


### Infrastructure model

![Infrastructure model](.infragenie/infrastructure_model.png)