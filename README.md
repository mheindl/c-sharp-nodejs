# .NET Node.JS Image
So far this image and this readme is pretty much "work in progress". 

## What is it? 
This docker image is based on `microsoft/dotnet:latest`. The following packages where installed in addition:
* Node.JS 10
* NuGet

## Why?
To integrate .NET Core Webapps with Angular frontends e.g. into GitLab CI/CD, we need the command line tools `dotnet`, `npm` and `nuget`. 

## How to use?
You could use it (for testings) directly from the command line and test if your project works like expected:
```
docker run -it -v "${PWD}:/app" -w /app mheindl/c-sharp-nodejs:latest dotnet build
```
Or in my case you can use it inside a `.gitlab-ci.yml`: 
```
image: mheindl/c-sharp-nodejs:latest

stages:
   - build
   - test
   - publish
   
build:
   stage: build
   script:
      - "dotnet clean"
      - "dotnet build"
      
test:
   stage: test
   script:
      - "dotnet test"
      
publish:
   stage: publish
   script:
      - "dotnet publish"
   artifacts:
      paths:
         - "./MyApplication/bin/Debug/netcoreapp2.1/publish/"
```
