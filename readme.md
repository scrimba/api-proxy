# Getting Started

This project was bootstrapped with [imba-base-template](https://github.com/imba/imba-base-template).

It aims to be a generic proxy for api´s where you can inject api keys / authentication without exposing it to the requester. It uses dotenv to define it´s workings.

    `api_base`: The root url to proxy - for example `https://api.openweathermap.org`
    `api_keys`: A comma separated list of api keys.


## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.
You will also see any lint errors in the console.

### `npm run build`

Builds the app for production to the `dist` folder.