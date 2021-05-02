const express = require("express");
const router = express.Router();
// const mongoose = require("mongoose");
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
    res.status(400).send(err);
    console.log(err);
  }
})

router.get('/allPass',async (req,res) => {
    const passwords = await Password.find();

    if(!passwords){
        res.status(500).json({success:false})
    }
    res.status(200).send(passwords);
})


module.exports = router;
