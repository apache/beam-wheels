<!--
    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
-->

# Apache Beam Wheels

## Overview

`beam-wheels` is a helper repository of [apache beam](https://github.com/apache/beam), which helps a Release 
Manager build python wheels on Linux/MacOS in a release process.

## Structure

There are 2 major parts in this repository.
* [multibuild](https://github.com/matthew-brett/multibuild) as git submodule, helps build python wheels based on different os.

* [travis](https://travis-ci.com/) configuration files, setups environment variables and deployment strategy.
  
  * `.travis.yml` contains a set of [environment variables](https://docs.travis-ci.com/user/environment-variables/) and steps of build process.
  * `deploy_travis.sh` defines that final python wheels will be deployed to [dist.apache.org/dev](https://dist.apache.org/repos/dist/dev/beam/)
    using svn with your apache credential.
  * `config.sh` defines custom build steps.

## User Guide

* Create and push a new branch(e.g. release-2.6.0) into the beam-wheels repository, which will trigger the travis build of that version.

* Confirm that build successful and wheels get staged in beam-wheels-staging gcs bucket.

