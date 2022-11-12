const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const date = require(__dirname + '/date.js');
var items = ["Buy Food","Cook Food"];
var workItems = ["Homework"];

app.set("view engine","ejs");
app.use(bodyParser.urlencoded(extended = true));
app.use(express.static(__dirname + "/public"));
app.get('/', function(req, res) {
    day = date.getDate();
    res.render("list", {'kindOfDay':day, 'items':items});
})

app.post("/",function(req, res){
    var item = req.body.newItem;
    if (req.body.btn == 'Work')
    {
        workItems.push(item);
        res.redirect("/work");
    }else{
    items.push(item);
    res.redirect("/");
    }
});


app.get("/work",function(req, res){
    res.render("list",{'kindOfDay':"Work List","items":workItems});
})


app.listen(3000,function () {
    console.log("Server Started on Port 3000");
})