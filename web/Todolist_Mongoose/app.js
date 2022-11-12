const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const date = require(__dirname + '/date.js');
const mongoose = require('mongoose');


mongoose.connect("mongodb://localhost:27017/todolistDB",{useNewUrlParser: true});

const itemsSchema = new mongoose.Schema({
    name:String
});

const Item = new mongoose.model("Item",itemsSchema);

const ListSchema = new mongoose.Schema({
    name:String,
    items: [itemsSchema]
});
const List = mongoose.model("List",ListSchema);

app.set("view engine","ejs");
app.use(bodyParser.urlencoded(extended = true));
app.use(express.static(__dirname + "/public"));

app.get('/', function(req, res) {
    
    Item.find({},function(err, foundItems){
        console.log(foundItems);
        res.render("list", {'listTitle':"Home", 'items':foundItems}); 
    })
})

app.get("/:customListName",function(req,res){
    const customListName = req.params.customListName;
    console.log(customListName);
    List.findOne({name:customListName},function(err,foundList){
        if(!err){
            if(!foundList){
                const list = new List({
                    name:customListName,
                    items: []
                });
            list.save();
            }else{
                res.render("list", {'listTitle':foundList.name, 'items':foundList.items})
            }
        }
    }); 
});

app.post("/",function(req, res){
    
    const itemName = req.body.newItem;
    const listName = req.body.btn;
    console.log(listName);
    const item = new Item({
        name: itemName
    });
    if (listName == "Home"){
        item.save();
        res.redirect('/');
    }else{
        List.findOne({name: listName},function(err,foundList){
            foundList.items.push(item);
            foundList.save();
            res.redirect('/'+listName);
        });
    }
    
});

app.post("/delete",function(req,res){
    const itemId = req.body.checkbox;
    const listName = req.body.listName;
    if(listName == "Home"){
        Item.findByIdAndRemove(itemId,function(err){
            console.log(err);
        })
        res.redirect("/");
    }else{
        List.findOneAndUpdate({
            name: listName
        },{
            $pull:{items:{_id:itemId}}
        },function(err,foundList){
            if(!err){
                res.redirect("/"+listName);
            }
        });
    }
    
})

app.listen(3000,function () {
    console.log("Server Started on Port 3000");
})