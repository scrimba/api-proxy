# Getting Started

This repo aims to be a generic proxy for api´s where you can inject api keys / authentication without exposing it to the requester. It uses dotenv to define it´s workings. 

1. Copy .env-example to .env and set the env vars to fit the api of choice

    `API_BASE`: The root url to proxy - for example `https://api.openweathermap.org`
    `API_KEYS`: A comma separated list of api keys.
    `API_AUTH_TYPE`: `query` / `bearer` / `header`
    `API_AUTH_KEY`: `appid`, `client_id`
    `OPENAI_ORG`: The organization ID for your account in openAI
    `PORT`: 3000

2. Copy example-pm2.json to pm2.json and set the fields to the values of choice.

3. To run:
    In dev: Run `imba -w server.imba`
    In prod: Run `pm2 start pm2.json` to start the api under pm2

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.
You will also see any lint errors in the console.

### `npm run build`

Builds the app for production to the `dist` folder.