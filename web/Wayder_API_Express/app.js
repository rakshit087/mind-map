const express = require('express');
const app = express();
const https = require('https');
const bodyParser = require("body-parser");

//Body parser is used to get input values
app.use(bodyParser.urlencoded({ extended:true }));

//The res is the response from our own server
app.get("/",function(req,res){
    res.sendFile(__dirname + "/index.html");
})

app.post("/",function(req,res){

    const city = req.body.city;
    const api_key = '' //Add your Api Key Here
    url = "https://api.openweathermap.org/data/2.5/weather?"+city+"&appid="+api_key;
    //The 'response' is the response from Weather API
    https.get(url, function(response) {
        console.log(response.statusCode);
        response.on('data', function(data) {
            const weather_data = JSON.parse(data);
            const description = weather_data.weather[0].description;
            console.log(description);
            res.write("The Weather is "+description);
            res.send()
        })
    })
    
})

app.listen(3000, function () {  
    console.log('Server is running');
})




    
    // 
    //

    //
    
    