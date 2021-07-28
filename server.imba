import express from 'express'
import body-parser from 'express'

import dotenv from 'dotenv'
import node-fetch from 'node-fetch'
import cors from 'cors'

import './docs'

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

app.use(cors!)
app.use(body-parser.text({ type: 'text/html' }))
app.use(body-parser.json({ type: 'application/json' }))

app.get('/') do(req,res,next)
	res.format
		json: do next()
		html: do 
			let out = <docs-page>
			res.send String(out)

# catch-all route that returns our index.html
app.all(/.*/) do(req,res)
	let url = new URL(base)
	url.pathname = req.path
	let options = {}
	let headers = 
		'Content-Type': req.headers['content-type']
	
	let body = req.headers['content-type'] == 'application/json' ? JSON.stringify(req.body) : req.body
	if process.env.API_AUTH_TYPE == 'query'
		let search = new URLSearchParams(req.query)
		search.append(process.env.API_AUTH_KEY, pick-key!)
		url.search = search
	console.log 'fetching from', url.href
	
	if process.env.API_AUTH_TYPE == 'bearer'
		headers.authorization = "Bearer {pick-key!}";
	
	let payload = await node-fetch(url,
		method: req.method
		body: ['POST', 'PUT'].includes(req.method) ? body : undefined
		headers: headers
		options: options)
	try
		let data = await payload.json!
		res.json(data)
	catch e
		res.status(404).send('Not found')

console.log "Starting api wrapper for {base} with {keys.length} api keys"
imba.serve app.listen(process.env.PORT or 3000)