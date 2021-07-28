export tag docs-page
	css body ff:sans
	css h1 fs:2xl @400:3xl @800:5xl mt:10px
	css ta:center fs:sm @400:md d:grid gt:repeat(2,auto) / 4fr
	get link do process..env ? process.env.DOCS_URL : ''
	
	<self>
		<html lang='en'>
			<head>
			<body>
				<h1> "Documentation"
				<p>
					"Find the api documentation here: "
					<a href="link"> link

