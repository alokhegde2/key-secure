const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

require("dotenv/config");

const User = require("../models/user");
const { registerValidation, logValidation } = require("../helpers/validation");
const verify = require("../helpers/verifyToken");

//Register a user

router.post("/register", async (req, res) => {
  //Validate the data before creating user

  const { error } = registerValidation(req.body);
  if (error) return res.status(400).send(error.details[0].message);

  //Checking if the user is already in the database

  const emailExist = await User.findOne({ email: req.body.email });

  if (emailExist) return res.status(400).send("Email already exists");

  //Hash passwords

  const salt = await bcrypt.genSalt(10);
  const hashPassword = await bcrypt.hash(req.body.password, salt);
  const hashMasterPassword = await bcrypt.hash(req.body.masterPassword, salt);

  let user = new User({
    name: req.body.name,
    email: req.body.email,
    password: hashPassword,
    masterPassword: hashMasterPassword,
  });

  try {
    savedUser = await user.save();
    res.status(200).send({ userId: user.id });
  } catch (err) {
    res.status(400).send(err);
    console.log(err);
  }
});

//Login user

router.post("/login", async (req, res) => {
    const secret = process.env.TOKEN_SECRET;
  
    //Validate the data before creating user
  
    const { error } = logValidation(req.body);
    if (error) return res.status(400).send(error.details[0].message);
  
    //Checking if the email is exists in the database
  
    const user = await User.findOne({ email: req.body.email });
  
    if (!user) return res.status(400).send("Email is not found");
  
    //Password is correct
    const validPass = await bcrypt.compare(req.body.password, user.password);
  
    if (!validPass) return res.status(400).send("Invalid Password");
  
    //Create and assign a token
  
    const token = jwt.sign(
      { id: user.id },
      secret,
      { expiresIn: "1d" }
    );
    res.header("auth-token", token).send(token);
  });


  //Master Password checking

router.post("/master", async (req, res) => {

  //Checking if the email is exists in the database

  const user = await User.findOne({ email: req.body.email });

  if (!user) return res.status(400).send("Email is not found");

  //Password is correct
  const validPass = await bcrypt.compare(req.body.masterPassword, user.masterPassword);

  if (!validPass) return res.status(400).send("Invalid Master Password");

  res.status(200).send("Master Password accepted");
});

//To get the single user

router.get("/:id", verify, async (req, res) => {
  const user = await User.findById(req.params.id).select("-password");

  if (!user) {
    return res.status(500).send("The user with the given id was not found");
  }
  res.status(200).send([user]);
});

module.exports = router;
