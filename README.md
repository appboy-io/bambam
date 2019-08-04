*BamBam - Performance Tool*
--------------
![performance](performance.gif)
Bam Bam! Hope you enjoy cloning and utilizing a simple performance measuring tool.

***How to Run It***
-------------------
Download the repo, and run the main.dart script
```dart
dart bin/main.dart -d 200 -w https://google.com -u 15
```

***Docker Implementation***
---------------------------
Currently working on a moving BamBam to a docker host. Currently if you'd like to host your own version somewhere, utilize the Dockerfile in the root of this project.


***Current State***
--------------
Currently the tool isn't robust at all. Currently you will manually have to alter the url in the stream class to get anything working. Future features coming to the repo:
* ~~Command line arguments for customizing run~~
* Customizing test using json
* A packing build script to run this test in a Jenkins build
* Add other http methods, POST, PUT, DELETE