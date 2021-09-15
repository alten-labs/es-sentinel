<img src=".assets/sentinel-prime.png" width="400" />

[![Maintained by CPrime Engineering](https://img.shields.io/badge/maintained%20by-cprime%20engineering-ED1846)](https://cprime.com/) 
[![Built for Engineers](https://img.shields.io/badge/project-embedded%20systems%20sentinel-ED1846)](https://github.com/cprimeinc)

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=pulp-digital_es-sentinel&metric=alert_status&token=362e645be7e5de95b43640b80cd9f4cb032ff44e)](https://sonarcloud.io/dashboard?id=pulp-digital_es-sentinel)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=pulp-digital_es-sentinel&metric=sqale_rating&token=362e645be7e5de95b43640b80cd9f4cb032ff44e)](https://sonarcloud.io/dashboard?id=pulp-digital_es-sentinel)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=pulp-digital_es-sentinel&metric=security_rating&token=362e645be7e5de95b43640b80cd9f4cb032ff44e)](https://sonarcloud.io/dashboard?id=pulp-digital_es-sentinel)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=pulp-digital_es-sentinel&metric=vulnerabilities&token=362e645be7e5de95b43640b80cd9f4cb032ff44e)](https://sonarcloud.io/dashboard?id=pulp-digital_es-sentinel)

# Embedded Systems Sentinel
A [SonarQube](https://www.sonarqube.org/) plugin to ensure code safety, security, portability and reliability in the context of embedded systems. This plugin validates code quality for [MISRA C](https://en.wikipedia.org/wiki/MISRA_C) and [AUTOSAR](https://www.autosar.org/) compliance.

## Documentation

Comprehensive documentation for this repo can be found in the [github pages](https://pulp-digital.github.io/es-sentinel/) website hosted within this repo.

## Project Management

Tasks and issues that relate to development of this repo can be found in this repo's [project board](https://github.com/pulp-digital/es-sentinel/projects/1).

## Useful Links

[Sonarsource documentation for plugin development.](https://docs.sonarqube.org/latest/extend/developing-plugin/)

[Sonarsource example plugin project on GitHub.](https://github.com/SonarSource/sonar-custom-plugin-example)

Back-end
--------

Todo...

### Building

To build the plugin JAR file, call:

```
mvn clean package
```

The JAR will be deployed to `target/sonar-example-plugin-VERSION.jar`. Copy this to your SonarQube's `extensions/plugins/` directory, and re-start SonarQube.

Front-end
---------

This plugin registers 4 extension pages in the SonarQube web app. They demonstrate how you can extend SonarQube's UI with new pages and interfaces.

### Prerequisites

* [NodeJS](https://nodejs.org/en/)

### Scripts

* `npm install` to install your dependencies.
* `npm start` to start a proxy server on port 3000 to debug your JS code.  
  *Note: This plugin must first be deployed and installed on your SonarQube instance, otherwise the extension paths will not be registered. See above under Back-end > Building*  
  This will proxy to a running SonarQube instance, but allow you to use your own local JavaScript instead of what was bundled with your plugin. Once started, you can access `http://localhost:3000` in your browser, and use SonarQube as you normally would.  
  You can use a different port by using the `PORT` environment variable. Example:  
  ```
  PORT=6060 npm start
  ```
  You can control to which SonarQube instance you proxy to by setting the `PROXY_URL` environment variable to any valid URL (defaults to `http://localhost:9000`). Example:  
  ```
  PROXY_URL=https://sonarqube.example.com npm start
  ```
* `npm test` to start watching your files for changes, and run tests accordingly.
* `npm run build` to build your front-end code.  
  Usually, you will not need to call this; instead, this should be part of your package building process.  
  See Back-end > Building above.

### Building

This example plugin uses [Webpack](https://webpack.js.org/) for building the final JavaScript. Whatever build system you choose to use, the final result *MUST* adhere to the following rules:

* 1 entry file *per extension page*.
* The name of each entry file must correspond to the `page_id` of the registered page (see `src/main/java/org/sonarsource/plugins/example/web/MyPluginPageDefinition.java` and compare with the entry points in `conf/webpack/webpack.config.js`).
* Each entry file must be located in the resulting JAR's `static/` folder.

The building process should be included in your full packaging process. In this example plugin, `mvn package` will call `npm run build` prior to finalizing the JAR package.

### Testing

This project uses [Jest](https://jestjs.io/) for testing. Running `npm test` will run Jest in `--watch` mode. You can find the configuration for Jest in `package.json`.

### How to use these files

It is recommended you check out the sources in `src/main/js/` directly. The code is well commented, and provides real-world examples on how to interact with SonarQube.

The pages are registered in `src/main/java/org/sonarsource/plugins/example/web/MyPluginPageDefinition.java`, and their respective front-end source code is located in `src/main/js/`. These examples use different stacks to demonstrate different possibilities:

* React JS examples (recommended, SonarQube uses React 16):
  * `src/main/js/portfolio_page/`
  * `src/main/js/admin_page/`
* Backbone JS example: `src/main/js/project_page/`
* Vanilla JS example: `src/main/js/global_page/`

#### Helper APIs exposed by SonarQube

There are several helper APIs exposed by SonarQube, like functions to make authenticated API requests.

You can find the full list of exposed helpers [here](https://github.com/SonarSource/sonarqube/blob/master/server/sonar-web/src/main/js/app/components/extensions/exposeLibraries.ts).

The included pages contain several examples:

* **API calls (`window.SonarRequest`)**  
  Check `src/main/js/common/api.js` for some examples.

* **Localization (`window.t()` and `window.tp()`)**  
  Localizable UI strings are defined in `src/main/resources/org/sonar/l10n/example/`. They are loaded at startup time, and can used by the global `t()` and `tp()` functions. See `src/main/js/admin_page/components/InstanceStatisticsApp.js` and `src/main/js/portfolio_page/components/VersionsMeasuresHistoryApp.js` for some examples. 

**Deprecation notice**

Starting with SonarQube 8.7, the following APIs are deprecated and won't be maintained anymore. They'll be dropped after the next SonarQube LTS version.

* **Measure helpers (`window.SonarMeasures`)**
* **React Components (`window.SonarComponents`)**

