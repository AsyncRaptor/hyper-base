// configure environment vars
require('dotenv').config();

// setup HyperExpress server
const HyperExpress  = require('hyper-express');
const app = new HyperExpress.Server();

// setup routes
app.get('/', (req, res) => {
  res.send('Hello HyperExpress');
});

// setup port and listen to it
const PORT = process.env.PORT || 3000;
app.listen(PORT);