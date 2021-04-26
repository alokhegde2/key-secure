const mongoose = require('mongoose');


//Schema 

const userSchema = new mongoose.Schema({
    name:{
        type:String,
        default:"",
        min:6,
        max:255
    },
    email:{
        type:String,
        required:true,
        max:255,
        min:6,
    },
    password:{
        type:String,
        required:true,
        min:6
    },
    masterPassword:{
        type:String,
        required:true
    },
    date:{
        type:Date,
        default:Date.now
    },
});

userSchema.virtual('id').get(function(){
    return this._id.toHexString();
})

userSchema.set('toJSON',{
    virtuals:true,
})


module.exports = mongoose.model('User',userSchema);