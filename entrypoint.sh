#!/usr/bin/env bash

if [ ! -f "firebase.json" ]; then
	touch firebase.json
	EMULATORS=("emulators.ui.enabled=true" "emulators.ui.host=0.0.0.0" "emulators.ui.port=${UI_PORT:-4141}")
	if [ -n "${FIRESTORE_PORT}" ]; then
    EMULATORS+=("emulators.firestore.host=0.0.0.0" "emulators.firestore.port=$FIRESTORE_PORT")
	fi
	if [ -n "${AUTH_PORT}" ]; then
	  EMULATORS+=("emulators.auth.host=0.0.0.0" "emulators.auth.port=$AUTH_PORT")
	fi
	if [ -n "${FUNCTIONS_PORT}" ]; then
	  EMULATORS+=("emulators.functions.host=0.0.0.0" "emulators.functions.port=$FUNCTIONS_PORT")
	fi
	if [ -n "${DATABASE_PORT}" ]; then
	  EMULATORS+=("emulators.database.host=0.0.0.0" "emulators.database.port=$DATABASE_PORT")
	fi
	if [ -n "${HOSTING_PORT}" ]; then
	  EMULATORS+=("emulators.hosting.host=0.0.0.0" "emulators.hosting.port=$HOSTING_PORT")
	fi
	if [ -n "${PUBSUB_PORT}" ]; then
	  EMULATORS+=("emulators.pubsub.host=0.0.0.0" "emulators.pubsub.port=$PUBSUB_PORT")
	fi
	jo -p -d. "${EMULATORS[@]}" > firebase.json
fi

if [ -z "${PROJECT_ID}" ]; then
  echo "Missing project ID"
  exit 1
fi

./firebase -P "${PROJECT_ID}" emulators:start

