## Todolist Goof

A vulnerable demo application, based on [java-goof](https://github.com/snyk-labs/java-goof) from [Snyk-Labs](https://github.com/snyk-labs) and protected at runtime by Cloud One Application Security.

The goal of this application is to demonstrate through example how to find, exploit and fix vulnerable Maven packages. 

## Build

First, clone the repo

```sh
$ git clone https://github.com/robi1021/c1-app-sec-java-goof.git
```

Now, set your Application Security keys

```sh
$ # YOUR KEYS HERE
$ export APPSEC_KEY=<your key>
$ export APPSEC_SECRET=<your secret>
$ # YOUR DOCKER HUB USERNAME (required for deploy.sh only)
$ export DOCKER_USERNAME=<your username>
```

Then build and run the container, which you can do by running

```sh
$ # Run app on your local docker engine
$ ./run.sh

$ # Deploy app with a loadbalancer service on your current kubernetes context
$ ./deploy.sh
```

## Container base image vulnerability exploit

- [Container base image exploit instructions](exploits/tomcat-rce/README.md)

## Log4Shell exploits 

- [Log4Shell exploits explained](exploits/log4shell/README.md)

## Test

```sh
curl -H "User-Agent: () { :; }; /bin/eject" http://127.0.0.1:8080
```

## Support

This is an Open Source community project. Project contributors may be able to help, depending on their time and availability. Please be specific about what you're trying to do, your system, and steps to reproduce the problem.

For bug reports or feature requests, please [open an issue](../../issues). You are welcome to [contribute](#contribute).

Official support from Trend Micro is not available. Individual contributors may be Trend Micro employees, but are not official support.

## Contribute

I do accept contributions from the community. To submit changes:

1. Fork this repository.
1. Create a new feature branch.
1. Make your changes.
1. Submit a pull request with an explanation of your changes or additions.

I will review and work with you to release the code.
