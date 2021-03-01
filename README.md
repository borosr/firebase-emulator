# Firebase emulator
A Firebase emulator in Docker container. You can customize it with environment variables.
It automatically starts the emulator's UI tool, which is exposed on port 4141. 
# Usage

You can configure it with environment variables or just mount your own `firebase.json`.

```shell
docker run --rm -it -p 4141:4141 -p 8200:8200 -e FIRESTORE_PORT=8200 -e PROJECT_ID=some-madeup-id --name firebase borosr/firebase-emulator 
```

## Environment variables
|Variable|Description|
|---|---|
|PROJECT_ID|A custom project ID, this is the only **required** variable|
|UI_PORT|The port of the emulator's UI. Default 4141|
|FIRESTORE_PORT|The port of Firestore service, if not set the service will disabled|
|AUTH_PORT|The port of Auth service, if not set the service will disabled|
|FUNCTIONS_PORT|The port of Functions service, if not set the service will disabled|
|DATABASE_PORT|The port of Realtime Database service, if not set the service will disabled|
|HOSTING_PORT|The port of Hosting service, if not set the service will disabled|
|PUBSUB_PORT|The port of Pub-Sub service, if not set the service will disabled|

# [License](LICENSE)