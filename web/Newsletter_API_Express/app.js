const express = require('express');
app = express();
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: true}));
const request = require('request');
const https = require('https');
//To give acess to local files in 'public' folder
app.use(express.static(__dirname + '/public'));

app.get('/',function(req,res){
    res.sendFile(__dirname+'/signup.html')
})

//Get the post data
app.post('/',function(req,res){
    var fName = req.body.fname;
    var lName = req.body.lname;
    var email = req.body.email;
    
    var data = {
        members:[
            {
                email_address: email,
                status: "subscribed",
                merge_feilds: {
                    FNAME: fName,
                    LNAME: lName
                }
            }
        ]
    };
    
    //to send data we want it to be in JSON format
    var jsonData = JSON.stringify(data);
    const url = "https://us17.api.mailchimp.com/3.0/lists/494abb2bfd";
    const options = {
        method: "POST",
        auth: "" //Your API Here
    }
    //To make requests to other servers we need http request
    const request = https.request(url, options, function(response) {
        if (response.status==200)
        {
            res.sendFile(__dirname+'/success.html')
        }else{
            res.sendFile(__dirname+'/failure .html')

        }
        response.on('data', function(data){
            console.log(JSON.parse(data));
        })
    })
 request.write(jsonData);
 request.end();
})


app.listen(3000,function(){
    console.log("Server Started");
})
