# Web TTY Buildpack

This is a [Cloud Native Buildpack](https://buildpacks.io) that create a terminal session in a browser for your container.

## Usage

```
$ echo '{"engines":{"node":"14.x"}}' > package.json
$ touch requirements.txt
$ pack build --buildpack jkutner/web-tty myapp
```

You can add other buildpacks using the `--buildpack` option (or `-b` for short) multiple times.

Then run your app

```
docker -it -p 3000:3000 myapp
```

Open a browser to `localhost:3000` and you'll see something like:

![Example](./assets/web-tty.png)

## Customizing

By default, the buildpack starts the terminal in a bash session. But you can override this with the `WEB_TTY_COMMAND` env var at build-time. For example, the following command will start the session in a Python REPL:

```
$ pack build -b jkutner/web-tty -e WEB_TTY_COMMAND=python myapp
```

If the terminal session is not your primary web process, you can override the port it uses by setting `WEB_TTY_PORT` at run-time. By defaul it will use `PORT` or `3000`.

## How it works

This buildpack installs [wetty](https://github.com/butlerx/wetty) into your image.
