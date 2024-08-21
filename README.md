# Laravel Horizon Demo

![laravel-horizon](https://github.com/user-attachments/assets/07a8ff5c-9257-4e2d-b450-851b9926bce2)


Laravel Horizon provides an easy-to-use, interactive GUI to monitor and interact with Redis queues.

Horizon was announced at Laracon US 2017 in NYC. It now supports Laravel 10.

## Quick start

1. Clone this project.

1. Run `composer install` to install the dependencies.

1. Run `cp .env.example .env` to create a `.env` file.

1. Enter values for these directives in your `.env` file:
    - `APP_KEY` → Run `php artisan key:generate` to easily generate a base64-encoded key.
    - `MAIL_*` → Enter Mailtrap credentials.
    - `REDIS_*` → A standard Redis installation usually does not require you to change values.

1. Run `php artisan config:cache` to cache the configuration values.

1. Create a blank `database.sqlite` under your `./database` directory.

1. Run `php artisan migrate --seed` to create a user table and seed it with dummy user information (e.g., name, email).

1. Open a new shell prompt and run:

    ```bash
    docker-compose up -d
    ```

    This will start the Laravel application and Redis services.

1. To serve the web application, use:

    ```bash
    docker-compose exec app php artisan serve --host 0.0.0.0
    ```

1. To start Horizon, use:

    ```bash
    docker-compose exec app php artisan horizon
    ```

1. Visit the Horizon dashboard at `http://localhost:8000/horizon`.

    ![horizon-cli](http://i.imgur.com/lh00VWzl.png)

1. By visiting `http://localhost:8000/api/dispatch-job` Or

```bash
docker-compose exec app php artisan tinker --execute="\App\Jobs\ExampleJob::dispatch();"
```
, you can now test Horizon by dispatching a job. The job example provided in the `ExampleJob` will be processed by Horizon.

    ![fetch-star-wars-entity-url](http://i.imgur.com/s9ZYw3Ll.png)

    Two async jobs are actually dispatched when you hit the URL above: (a) one that fetches from the Star Wars API and (b) another one that sends a notification email.

    ![two-jobs](http://i.imgur.com/g7IrLGjl.png)

    Note: You can increase the number of requests sent (and conversely, resulting email notifications) by adjusting the logic in the `ExampleJob` class.

## Requirements

- PHP v8.2
- Redis v6.x
- Laravel 10

## Attributions

This wouldn't be possible without being granted a role as Software Developer at Pixel Fusion, an award-winning product development company at Parnell, Auckland.
