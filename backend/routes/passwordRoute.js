const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");
// const jwt = require("jsonwebtoken");

const verify = require("../helpers/verifyToken");
const Password = require("../models/password");

require("dotenv/config");

router.post('/newPass',async (req,res) => {


  let password = new Password({
    appName: req.body.appName,
    appUserId: req.body.appUserId,
    appPassword: req.body.appPassword,
    appMailId: req.body.appMailId,
    userId: req.body.userId,
    appType: req.body.appType,
    isFavourite: req.body.isFavourite,
    note: req.body.note,
  });

  try {
    savedPassword = await password.save();
    res.status(200).send("Password Saved");
  } catch (err) {
    res.status(400).json(savedPassword);
    console.log(err);
  }
})

// router.get('/allPass',async (req,res) => {
//     const passwords = await Password.find();
//
//     if(!passwords){
//         res.status(500).json({success:false})
//     }
//     res.status(200).send(passwords);
// })

router.put('/:id',async(req,res) => {
    // if(mongoose.isValidObjectId(req.params.id)){
    //   res.status(400).send('Invalid password id')
    // }
    const password = await Password.findByIdAndUpdate(
        req.params.id,
        {
          appName: req.body.appName,
          appUserId: req.body.appUserId,
          appPassword: req.body.appPassword,
          appMailId: req.body.appMailId,
          userId: req.body.userId,
          appType: req.body.appType,
          isFavourite: req.body.isFavourite,
          note: req.body.note,
        },
        {new:true}
    )
     if(!password){
         return res.status(400).json({message:"The password cannot be updated!"})
     }
     res.status(200).send(password)
})



router.get('/:id',async (req,res) => {
    const password = await Password.find({userId:req.params.id});

    if(!password){
        res.status(500).json({success:false})
    }
    res.status(200).send(password);
})

router.delete('/:id',(req,res) =>{
  Password.findByIdAndRemove(req.params.id).then(password =>{
      if(password){
          return res.status(200).json({success:true,message:"The password is deleted"})
      } else{
          return res.status(404).json({success:false,message:"Password not found"})
      }
  }).catch(err =>{
      return res.status(400).json({success:false,error:err})
  })
})

module.exports = router;
