const express = require("express");
const bodyParser = require('body-parser');
const morgan = require("morgan");
const mongoose = require("mongoose");
const cors  = require('cors')

require("dotenv/config");

//Routes

const userRouter = require('./routes/userRoute')




const app = express();


const api = process.env.API_URL;

app.use(cors())
app.options('*',cors())

//middlewares

app.use(bodyParser.json());
app.use(morgan("tiny"));


//Route middleware

app.use(`${api}/users`,userRouter)




//Connecting to database

mongoose
  .connect(process.env.CONNECTION_STRING, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    dbName: "key_secure",
  })
  .then(() => {
    console.log("Database connection is ready");
  })
  .catch((err) => {
    console.log(err);
  });


app.listen('3000',()=>{
    console.log("Server is running at http://localhost:3000");
});