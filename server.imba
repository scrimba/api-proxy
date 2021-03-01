import express from 'express'
import dotenv from 'dotenv'
import node-fetch from 'node-fetch'

dotenv.config()

const app = express!

const raw_keys = process.env.API_KEYS
unless raw_keys
	console.log "Please add API_KEYS to your .env file"
	process.exit(-1)

const base = process.env.API_BASE
unless raw_keys
	console.log "Please add API_BASE to your .env file"
	process.exit(-1)

const keys = raw_keys.split(',')
let key-index = 0


def pick-key
	key-index = key-index + 1
	if key-index >= keys.length
		key-index = 0
	keys[key-index]

# catch-all route that returns our index.html
app.get(/.*/) do(req,res)
	let url = new URL(base)
	let search = new URLSearchParams(req.query)
	url.pathname = req.path
	search.append('appid', pick-key!)
	url.search = search
	console.log 'fetching from', url.href
	let options = {}
	let payload = await node-fetch(url, options)
	try
		let data = await payload.json!
		res.json(data)
	catch e
		res.status(404).send('Not found')
console.log "Starting api wrapper for {base} with {keys.length} api keys"
imba.serve app.listen(process.env.PORT or 3000)