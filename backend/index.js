const express=require("express");
const mongoose=require("mongoose");
const authRouter=require("./routes/auth");


const app=express();
app.use(express.json());
app.use(authRouter);

const  PORT=process.env.PORT || 3000;
const DB="your Database connection" // add your mongo db database connection


mongoose
    .connect(DB)
    .then(()=>{console.log("DB connection successful")})
    .catch(e=>{console.log(e)})

app.listen(PORT,"0.0.0.0",()=>{
    console.log(`Connected at port ${PORT}`);
})

