//Validation
const Joi = require("joi");

//Register validation

const registerValidation = (data) => {
  const schema = Joi.object({
    name: Joi.string().min(6),
    email: Joi.string().min(6).required().email(),
    password: Joi.string().min(6).required(),
    masterPassword: Joi.string().min(4).required(),
  });

  return schema.validate(data);
};

const loginValidation = (data) => {
    const schema = Joi.object({
      email: Joi.string().min(6).required().email(),
      password: Joi.string().min(6).required(),
    });
  
    return schema.validate(data);
  };


module.exports.registerValidation = registerValidation;
module.exports.logValidation = loginValidation;